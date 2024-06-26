require 'rails_helper'

RSpec.describe Order, type: :model do
    let (:user) { create(:user) }
    let (:raw_material) { create(:raw_material) }
    let (:order) { create(:order, user: user, raw_material: raw_material) }

    context 'with valid presence attributes' do
        it 'is valid' do
            expect(order).to be_valid
        end

        it 'is not valid without a car_id' do
            order = build(:order, car_id: nil)
            expect(order).to_not be_valid
        end

        it 'is not valid without a requested_date' do
            order = build(:order, requested_date: nil)
            expect(order).to_not be_valid
        end

        it 'is not valid without a received_date' do
            order = build(:order, received_date: nil)
            expect(order).to_not be_valid
        end

        it 'is not valid without a extraction_start' do
            order = build(:order, extraction_start: nil)
            expect(order).to_not be_valid
        end

        it 'is not valid without a extration_end' do
            order = build(:order, extraction_end: nil)
            expect(order).to_not be_valid
        end

        it 'is not valid without a release_date' do
            order = build(:order, release_date: nil)
            expect(order).to_not be_valid
        end


        it 'is not valid without a raw_material_id' do
            order = build(:order, raw_material_id: nil)
            expect(order).to_not be_valid
        end
    end
end