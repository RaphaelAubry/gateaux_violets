class Dimension < ApplicationRecord
  has_many :lines

  validates :share, presence: true
  validates :level, presence: true
end
