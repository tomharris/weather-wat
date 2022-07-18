# typed: strict
class WeatherApi
  extend T::Sig

  sig { returns(WeatherApi) }
  def self.client
    @client = T.let(@client, T.nilable(WeatherApi))
    @client ||= WeatherApi.new(T.must(ENV['WEATHER_API_KEY']), T.must(ENV["WEATHER_API_ENDPOINT"]))
  end

  sig { params(api_key: String, api_endpoint: String).void }
  def initialize(api_key, api_endpoint)
    @api_key = api_key
    @api_endpoint = api_endpoint
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
    uri = URI(@api_endpoint)
    uri.query = URI.encode_www_form(
      lat: latitude,
      lon: longitude,
      units: "imperial",
      appid: @api_key,
      exclude: "minutely,hourly,daily",
    )

    Net::HTTP.get(uri)
  end

  sig { params(response: T::Hash[String, T.untyped]).returns(T::Hash[Symbol, T.untyped]) }
  def extract_info(response)
    {
      latitude: response["coord"]["lat"],
      longitude: response["coord"]["lon"],
      temperature: response["main"]["temp"],
      feels_like: response["main"]["feels_like"],
      weather_type: response["weather"].first["main"],
      weather_description: response["weather"].first["description"],
    }
  end
end
