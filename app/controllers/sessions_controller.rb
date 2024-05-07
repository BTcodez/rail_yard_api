class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = jwt_encode(user.id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def jwt_encode(payload, exp = 24.hours.from_now.to_i)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
end
