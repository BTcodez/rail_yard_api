require 'rails_helper'

RSpec.describe User, type: :model do
    let (:user) { build(:user) }

        context 'with valid presence attributes' do
            it 'is valid' do
                expect(user).to be_valid
            end
        
            it 'is not valid without a name' do
                user = build(:user, name: nil)
                expect(user).to_not be_valid
            end
        
            it 'is not valid without an email' do
                user = build(:user, email: nil)
                expect(user).to_not be_valid
            end
        
            it 'is not valid without an password_digest' do
                user = build(:user, password_digest: nil)
                expect(user).to_not be_valid
            end
        end
    
        context 'with valid email attributes' do
            it 'is invalid with a duplicate email' do
              create(:user, email: "john@example.com")
              user = build(:user, email: "john@example.com")
              expect(user).to_not be_valid
              expect(user.errors[:email]).to include("has already been taken")
            end
        
            it 'is invalid with an invalid email' do
                user = build(:user, email: :"testemail.com")
                expect(user).to_not be_valid
            end
        end

        context 'with valid name attributes' do
            it 'is invalid due to name formatting' do
                user = build(:user, name: "Rev. John Murdock")
                expect(user).to_not be_valid
            end
        end

        context 'with valid password attributes' do
            it 'is invalid when the password is below 10 characters.' do
            user = build(:user, password_digest: '1j5hv73')
            expect(user).to_not be_valid
        end
    end
end