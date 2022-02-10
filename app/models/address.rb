class Address < ApplicationRecord
  belongs_to :user

  validates :name, :surname,  presence: true, format: { with: /[A-Z]/ } #start with uppercase
  validates :address, presence: true
  validates :zip_code, presence: true, format: { with: /(([0-95]{2})[0-9]{3})/ } #start with 2 digits between 1-95 followed by 3 digits
  validates :city, presence: true
  validates :phone, presence: true, format: { with: /[0]\d{9}/ } #start with 0 followed by 9 digits
end
