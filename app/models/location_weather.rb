# typed: strict

class LocationWeather < T::Struct
  extend T::Sig

  const :latitude, Float
  const :longitude, Float
  const :temperature, Float
  const :feels_like, Float
  const :weather_type, String
  const :weather_description, String

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
end
