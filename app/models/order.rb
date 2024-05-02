class Order < ApplicationRecord
  belongs_to :user
  belongs_to :raw_material
end
