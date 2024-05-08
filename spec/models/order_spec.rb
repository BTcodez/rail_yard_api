require 'rails_helper'

RSpec.describe Order, type: :model do
    let (:order) { build(:order) }

    context 'with valid presence attributes' do
        it 'is valid' do
            expect(order).to be_valid
        end

        it 'is not valid without a car_id'
    end
end