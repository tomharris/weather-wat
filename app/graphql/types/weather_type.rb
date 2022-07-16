# typed: strict
# frozen_string_literal: true

module Types
  class WeatherType < Types::BaseObject
    field :outsite_condition, String
    field :subjective_temperature, String
  end
end
