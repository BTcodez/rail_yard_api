require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      expect(build(:user)).to be_valid
    end

    it 'is not valid without a name' do
      expect(build(:user, name: nil)).to_not be_valid
    end

    it 'is not valid without an email' do
      expect(build(:user, email: nil)).to_not be_valid
    end

    it 'ensures email is unique' do
      create(:user, email: 'unique@example.com')
      user_with_same_email = build(:user, email: 'unique@example.com')
      expect(user_with_same_email).to_not be_valid
    end
  end
end

