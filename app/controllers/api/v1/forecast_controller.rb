class Api::V1::ForecastController < ApplicationController
  def index
    # binding.pry
    if params[:location].present? && !numeric(params[:location])
      data = WeatherFacade.get_weather_data(params[:location])
      render json: ForecastSerializer.send_weather(data)
    else
      render json: { error: 'Not a valid query' }, status: :not_found
    end
  end

  def numeric(params)
    Float(params) != nil rescue false
  end
end
