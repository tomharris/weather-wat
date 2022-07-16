# typed: strict
module Types
  class QueryType < Types::BaseObject
    extend T::Sig

    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :location_weather, WeatherType, null: false,
      description: "Weather for a specific location" do
      
      argument :latitude, Float, required: true, description: "Latitude"
      argument :longitude, Float, required: true, description: "Longitude"
    end

    sig { params(latitude: Float, longitude: Float).returns(LocationWeather) }
    def location_weather(latitude:, longitude:)
      WeatherApi.client.get_location_weather(latitude, longitude)
    end
  end
end
