class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = BreweriesFacade.get_breweries_data(params[:location], params[:quantity])
    weather = WeatherFacade.get_weather_data(params[:location])
    render json: BrewerySerializer.send_breweries(breweries, params[:location], weather.current_weather)
  end
end
