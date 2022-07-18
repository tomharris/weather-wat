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
    LocationWeather.extract_from(
      JSON.parse(get_current_weather(latitude, longitude))
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
end
