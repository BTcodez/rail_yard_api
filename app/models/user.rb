class User < ApplicationRecord
    has_secure_password
#Validations:
    validates :name, 
        presence: true, 
        length: { minimum: 1, maximum: 100 }, 
        format: { with: /\A[a-zA-Z\s\-']+\z/, message: "only allows letters, spaces, hyphens, and apostrophes" }

    validates :email, 
        presence: true, 
        uniqueness: true, 
        format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }    

    validates :password_digest,
        presence: true, 
        length: { minimum: 10 } #Adjust length as needed.

    validates :user_type, 
        presence: true 

    has_many :orders
end
