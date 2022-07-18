# frozen_string_literal: true

module Types
  class WeatherAlertType < Types::BaseObject
    field :sender, String
    field :event, String
    field :start, Integer
    field :end, Integer
    field :description, String
  end
end
