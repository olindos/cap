class PhoneNumber < ApplicationRecord
  validates :number, :person_id, presence: true
  has_one :person
end
