require 'rails_helper'

RSpec.describe User, type: :model do
    let (:user) { build(:user) }

    context 'validation tests' do
        it 'is valid' do
            expect(user).to be_valid
        end

        it 'is not valid without a name' do
            build(:user, name: nil)
            expect(user).to_not be_valid
        end
    end
end