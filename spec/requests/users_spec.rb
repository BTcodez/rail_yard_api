require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    {
      name: "John Doe",
      email: "john.doe@example.com",
      password: "password1234",
      password_confirmation: "password1234",
      user_type: "admin"
    }
  }
  let(:invalid_attributes) {
    {
      name: "",
      email: "john.doe",
      password: "short",
      password_confirmation: "short",
      user_type: ""
    }
  }
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:authenticate_request).and_return(true)
  end

  describe "GET #index" do
    it "returns a success response" do
      user
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post :create, params: { user: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do
        post :create, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "Jane Doe",
          email: "jane.doe@example.com"
        }
      }

      it "updates the requested user" do
        put :update, params: { id: user.to_param, user: new_attributes }
        user.reload
        expect(user.name).to eq("Jane Doe")
        expect(user.email).to eq("jane.doe@example.com")
      end

      it "renders a JSON response with the user" do
        put :update, params: { id: user.to_param, user: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the user" do
        put :update, params: { id: user.to_param, user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user
      expect {
        delete :destroy, params: { id: user.to_param }
      }.to change(User, :count).by(-1)
    end
  end
end

