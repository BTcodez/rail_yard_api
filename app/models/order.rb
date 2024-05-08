class Order < ApplicationRecord
#Validations:
  validates :car_id, presence: true, length: { maximum: 50 }
  validates :requested_date, presence: true
  validate :date_consistency
  
#Associations:
  belongs_to :user
  belongs_to :raw_material
end


private

def date_consistency
  return if requested_date.nil? || received_date.nil?
  return if received_date.nil? || received_date.nil?
  return if extraction_start.nil? || extraction_start.nil?
  return if extraction_end.nil? || extraction_end.nil?
  return if release_date.nil? || release_date.nil?
  
  if requested_date > received_date
    errors.add(:requested_date, "must be before the received_date")
  end

  if extraction_start > received_date
    errors.add(:received_date, "must be before the extraction_start")
  end

  if extraction_end > extraction_start
    errors.add(:extraction_start, "must be before the extraction_end")
  end

  if release_date > extraction_end
    errors.add(:extraction_end, "must be before the released_date")
  end
end
