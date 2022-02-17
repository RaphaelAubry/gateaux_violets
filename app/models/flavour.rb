class Flavour < ApplicationRecord
  has_many :lines

  validates :description, presence: true
end
