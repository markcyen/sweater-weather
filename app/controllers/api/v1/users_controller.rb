class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    user[:email] = user[:email].downcase
    if user.save
      user.update(api_key: SecureRandom.hex(20))
      render json: UserSerializer.new(user), status: :created
    else
      render json: { error: 'No valid input' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
