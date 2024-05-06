class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JWT.decode(header, Rails.application.credentials.secret_key_base).first
      @current_user = User.find(decoded['user_id'])
    rescue JWT::ExpiredSignature
      render json: { error: 'Expired token' }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
