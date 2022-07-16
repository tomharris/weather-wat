# typed: strict

class LocationWeather < T::Struct
  extend T::Sig

  const :latitude, Float
  const :longitude, Float
  const :temperature, Float

  sig { returns(String) }
  def outsite_condition
    "clear"
  end

  sig { returns(String) }
  def subjective_temperature
    "hot"
  end
end
