class Api::V1::RoadTripController < ApplicationController
  def create
    found_user = User.find_by(api_key: check_user[:api_key])
    if !check_user[:start_city].present? ||
        !check_user[:end_city].present?
      render json: ErrorSerializer.send_error('Bad request'), status: :bad_request
    elsif
      if found_user
        trip_data = RoadTripFacade.get_directions_data(check_user[:start_city], check_user[:end_city])
        weather_at_eta = WeatherFacade.get_weather_data(check_user[:end_city])
        render json: RoadTripSerializer.send_trip_details(check_user[:start_city], check_user[:end_city], trip_data, weather_at_eta)
      else
        render json: ErrorSerializer.send_error('Invalid entry'), status: :unauthorized
      end
    end
  end

  private

  def check_user
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
