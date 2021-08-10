class Api::V1::RoadTripController < ApplicationController
  def create
    # binding.pry
    found_user = User.find_by(api_key: check_user[:api_key])
    # binding.pry
    if found_user
      trip_data = RoadTripFacade.get_directions_data(params[:origin], params[:destination])
      weather_at_eta = WeatherFacade.get_weather_data(params[:destination])
      render json: RoadTripSerializer.send_trip_details(params[:origin], params[:destination], trip_data, weather_at_eta)
    else
      render json: ErrorSerializer.send_error('Invalid entry'), status: :unauthorized
    end
  end

  private

  def check_user
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
