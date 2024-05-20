require 'rails_helper'

RSpec.describe 'OrdersController', type: :request do
  describe 'POST /orders' do 
    let(:user) { 
      User.create!(
        name: 'Test User',
        email: 'testemail@test.com',
        password_digest: 'password123',
        user_type: 'General User'
        ) 
      }

    let(:raw_material) {RawMaterial.create!(name: 'Test Material') }

    let(:valid_attributes) {
      {
        car_id: 'ULX19230590',
        requested_date: '2024-04-24',
        received_date: '2024-04-29',
        extraction_start: '2024-05-01',
        extraction_end: '2024-05-02',
        release_date: '2024-05-06',
        user_id: '1',
        raw_material_id: '12',
        weight: '1000'
      }
    }
  
    context 'when the request is valid' do
        before do
          post '/orders', params: { order: valid_attributes }
          puts response.body
        end

        it 'creates a new order' do 
        expect { 
          post '/orders', params: { order: valid_attributes }
        }.to change(Order, :count).by(1)
      end
    end
  end
end