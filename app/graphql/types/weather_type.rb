# typed: strict
# frozen_string_literal: true

module Types
  class WeatherType < Types::BaseObject
    field :temperature, Float, null: false, description: "Temperature"
    field :outsite_condition, String, null: false, description: "Outsite condition"
    field :subjective_temperature, TemperatureCategory, null: false, description: "Subjective temperature"
    field :feels_like, Float, null: false, description: "Feels like"
    field :weather_type, String, null: false, description: "Primary Weather Condition"
    field :weather_description, String, null: false, description: "Primary Weather Condition Description"

    field :alerts, [WeatherAlertType], null: false, description: "Active Alerts (if any)"
  end
end
