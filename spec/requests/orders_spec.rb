require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:raw_material) { create(:raw_material) }
  let(:valid_attributes) {
    {
      car_id: "ABC123",
      requested_date: Date.today,
      received_date: Date.tomorrow,
      extraction_start: Date.tomorrow + 1.day,
      extraction_end: Date.tomorrow + 2.days,
      release_date: Date.tomorrow + 3.days,
      weight: 100,
      user_id: user.id,
      raw_material_id: raw_material.id
    }
  }
  let(:invalid_attributes) {
    {
      car_id: "",
      requested_date: Date.tomorrow + 3.days,
      received_date: Date.tomorrow,
      extraction_start: Date.yesterday,
      extraction_end: Date.yesterday - 1.day,
      release_date: Date.today,
      weight: -100
    }
  }
  let(:order) { create(:order, user: user, raw_material: raw_material) }

  before do
    allow(controller).to receive(:authenticate_request).and_return(true)
  end

  describe "GET #index" do
    it "returns a success response" do
      order
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: order.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, params: { order: valid_attributes }
        }.to change(Order, :count).by(1)
      end

      it "renders a JSON response with the new order" do
        post :create, params: { order: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "does not create a new Order" do
        expect {
          post :create, params: { order: invalid_attributes }
        }.to_not change(Order, :count)
      end
    
      it "renders a JSON response with errors for the new order" do
        post :create, params: { order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "when not authenticated" do
      before do
        allow(controller).to receive(:authenticate_request) do
          controller.render json: { errors: 'Unauthorized' }, status: :unauthorized
        end
      end

      it "does not create a new Order" do
        expect {
          post :create, params: { order: valid_attributes }
        }.to_not change(Order, :count)
      end

      it "responds with unauthorized status" do
        post :create, params: { order: valid_attributes }
        expect(response).to have_http_status(:unauthorized)
      end
    end
end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          car_id: "XYZ789"
        }
      }

      it "updates the requested order" do
        put :update, params: { id: order.to_param, order: new_attributes }
        order.reload
        expect(order.car_id).to eq("XYZ789")
      end

      it "renders a JSON response with the order" do
        put :update, params: { id: order.to_param, order: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the order" do
        put :update, params: { id: order.to_param, order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order" do
      order
      expect {
        delete :destroy, params: { id: order.to_param }
      }.to change(Order, :count).by(-1)
    end
  end
end