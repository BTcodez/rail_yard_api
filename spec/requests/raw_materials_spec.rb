require 'rails_helper'

RSpec.describe RawMaterialsController, type: :controller do
  let(:valid_attributes) {
    { material_name: "Corn Syrup" }
  }
  let(:invalid_attributes) {
    { material_name: "" }
  }
  let(:raw_material) { create(:raw_material) }

  before do
    allow(controller).to receive(:authenticate_request).and_return(true)
  end

  describe "GET #index" do
    it "returns a success response" do
      raw_material
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
  it "returns a success response" do
    raw_material = RawMaterial.create! valid_attributes
    get :show, params: { id: raw_material.id }
    expect(response).to be_successful
  end
end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RawMaterial" do
        expect {
          post :create, params: { raw_material: valid_attributes }
        }.to change(RawMaterial, :count).by(1)
      end

      it "renders a JSON response with the new raw_material" do
        post :create, params: { raw_material: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new raw_material" do
        post :create, params: { raw_material: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
  context "with valid params" do
    let(:new_attributes) {
      { material_name: "Aluminum" }
    }

    it "updates the requested raw_material" do
      raw_material = RawMaterial.create! valid_attributes
      put :update, params: { id: raw_material.id, raw_material: new_attributes }
      raw_material.reload
      expect(raw_material.material_name).to eq("Aluminum")
    end

    it "renders a JSON response with the raw_material" do
      raw_material = RawMaterial.create! valid_attributes
      put :update, params: { id: raw_material.id, raw_material: valid_attributes }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
  
    context "with invalid params" do
      it "renders a JSON response with errors for the raw_material" do
        put :update, params: { id: raw_material.to_param, raw_material: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested raw_material" do
      raw_material
      expect {
        delete :destroy, params: { id: raw_material.to_param }
      }.to change(RawMaterial, :count).by(-1)
    end
  end
end