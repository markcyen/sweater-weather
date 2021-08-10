class Api::V1::SessionsController < ApplicationController
  def create
    found_user = User.find_by(email: user_sessions[:email])
    if found_user && found_user.authenticate(user_sessions[:password])
      render json: UserSerializer.new(found_user)
    else
      render json: ErrorSerializer.send_error('Invalid email or password'), status: :unauthorized
    end
  end

  private

  def user_sessions
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
