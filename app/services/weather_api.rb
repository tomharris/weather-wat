# typed: strict
class WeatherApi
  extend T::Sig

  API_ENDPOINT = T.let("https://api.openweathermap.org/data/2.5/weather", String)

  sig { returns(WeatherApi) }
  def self.client
    @client = T.let(@client, T.nilable(WeatherApi))
    @client ||= WeatherApi.new(T.must(ENV['WEATHER_API_KEY']))
  end

  sig { params(api_key: String).void }
  def initialize(api_key)
    @api_key = api_key
  end

  sig { params(latitude: Float, longitude: Float).returns(LocationWeather) }
  def get_location_weather(latitude, longitude)
    LocationWeather.new(
      **T.unsafe(
        extract_info(
          JSON.parse(get_current_weather(latitude, longitude))
        )
      )
    )
  end

  private

  sig { params(latitude: Float, longitude: Float).returns(String) }
  def get_current_weather(latitude, longitude)
    uri = URI(API_ENDPOINT)
    uri.query = URI.encode_www_form(
      lat: latitude,
      lon: longitude,
      appid: @api_key,
    )

    Net::HTTP.get(uri)
  end

  sig { params(response: Net::HTTPResponse).returns(T::Hash[Symbol, Float]) }
  def extract_info(response)
    {
      latitude: response["coord"]["lat"],
      longitude: response["coord"]["lon"],
      temperature: response["main"]["temp"]
    }
  end
end
