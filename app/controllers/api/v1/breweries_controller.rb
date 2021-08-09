class Api::V1::BreweriesController < ApplicationController
  def index
    if params[:quantity].to_i <= 0 ||
        !params[:location].present? ||
        numeric(params[:location])
      render json: { error: 'Invalid query' }, status: :not_found
    else
      breweries = BreweriesFacade.get_breweries_data(params[:location], params[:quantity].to_f.round)
      weather = WeatherFacade.get_weather_data(params[:location])
      render json: BrewerySerializer.send_breweries(breweries, params[:location], weather.current_weather)
    end
  end
end
