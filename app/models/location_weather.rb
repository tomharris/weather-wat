# typed: strict

class LocationWeather < T::Struct
  extend T::Sig

  const :latitude, Float
  const :longitude, Float
  const :temperature, Float
  const :feels_like, Float
  const :weather_type, String
  const :weather_description, String
  const :alerts, T::Array[WeatherAlert]

  sig { returns(String) }
  def subjective_temperature
    if feels_like < 50
      "Cold"
    elsif feels_like >= 60 && feels_like < 75
      "Moderate"
    else
      "Hot"
    end
  end

  sig { params(response: T::Hash[String, T.untyped]).returns(LocationWeather) }
  def self.extract_from(response)
    new(
      latitude: response["lat"],
      longitude: response["lon"],
      temperature: response["current"]["temp"],
      feels_like: response["current"]["feels_like"],
      weather_type: response["current"]["weather"].first["main"],
      weather_description: response["current"]["weather"].first["description"],
      alerts: response["alerts"]&.map { |alert| WeatherAlert.extract_from(alert) } || [],
    )
  end
end
