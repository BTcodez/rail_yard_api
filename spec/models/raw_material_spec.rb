require 'rails_helper'

RSpec.describe RawMaterial, type: :model do
    let (:raw_material) { build(:raw_material) }

    context 'with valid presence attributes' do
        it 'is valid' do
            expect(raw_material).to be_valid
        end

        it 'is not valid without a material_name' do
            raw_material = build(:raw_material, material_name: nil)
            expect(raw_material).to_not be_valid
        end
    end
end