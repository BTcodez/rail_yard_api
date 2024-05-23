require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user, password: 'password123') }
  let(:secret_key) { Rails.application.credentials.secret_key_base }

  describe "POST #create" do
    context "with valid credentials" do
      it "returns a JWT token" do
        post :create, params: { email: user.email, password: 'password123' }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')

        json_response = JSON.parse(response.body)
        expect(json_response).to have_key("token")

        # Decode the JWT token to ensure it's valid
        decoded_token = JWT.decode(json_response["token"], secret_key, true, algorithm: 'HS256')
        expect(decoded_token[0]["user_id"]).to eq(user.id)
      end
    end

    context "with invalid credentials" do
      it "returns an unauthorized status" do
        post :create, params: { email: user.email, password: "wrongpassword" }
        expect(response).to have_http_status(:unauthorized)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to have_key("error")
      end
    end
  end
end