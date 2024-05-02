class RawMaterial < ApplicationRecord
#Validations:
    validates :material_name, 
        presence: true, 
        length: { minimum: 1, maximum: 255 }
  
    validates :weight, 
        presence: true, 
        numericality: { greater_than_or_equal_to: 0 }
 
#Associations:
    has_many :orders
end
