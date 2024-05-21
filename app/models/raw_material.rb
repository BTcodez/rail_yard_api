class RawMaterial < ApplicationRecord
#Validations:
    validates :material_name, 
        presence: true, 
        length: { minimum: 1, maximum: 255 }
 
#Associations:
    has_many :orders
end
