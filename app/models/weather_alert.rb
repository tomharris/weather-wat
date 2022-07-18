# typed: strict

class WeatherAlert < T::Struct
  extend T::Sig

  const :sender, String
  const :event, String
  const :description, String
  const :start, Integer
  const :end, Integer

  sig { params(response: T::Hash[String, T.untyped]).returns(WeatherAlert) }
  def self.extract_from(response)
    new(
      sender: response["sender_name"],
      event: response["event"],
      start: response["start"],
      end: response["end"],
      description: response["description"],
    )
  end
end
