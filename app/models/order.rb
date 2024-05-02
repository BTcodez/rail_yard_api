class Order < ApplicationRecord
#Validations:
  validates :car_id, presence: true, length: { maximum: 50 }
  validates :requested_date, presence: true
  validates :received_date, presence: true
  validates :extraction_start, presence: true
  validates :extraction_end, presence: true
  validates :release_date, presence: true
  validate :date_consistency
  
#Associations:
  belongs_to :user
  belongs_to :raw_material
end


private

def date_consistency
  if extraction_start > extraction_end
    errors.add(:extraction_start, "cannot be later than extraction end")
  end
  if received_date > extraction_start
    errors.add(:received_date, "cannot be later than the extraction start")
  end
  if requested_date > received_date
    errors.add(:requested_date, "cannot be later than the received date")
  end
  if extraction_end > release_date
    errors.add(:extraction_end, "cannot be later than the release date")
  end
end
