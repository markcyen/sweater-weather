class Api::V1::UsersController < ApplicationController
  def create
    # binding.pry
    user = User.create(user_params)
    # binding.pry
    # if user.save
      user.update(api_key: SecureRandom.hex(20))
      render json: UserSerializer.create_new(user)
    # else
    #   render json: { error: 'No valid input' }, status: :not_found
    # end
    # binding.pry
  end

  private

  def user_params
    params.permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
