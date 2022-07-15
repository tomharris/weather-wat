class GraphqlController < ApplicationController

  def execute
    result = WeatherWatSchema.execute(
      params[:query],
      variables: params[:variables],
    )
    render json: result
  end
end
