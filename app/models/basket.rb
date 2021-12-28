class Basket < ApplicationRecord
  belongs_to :user
  has_many :lines, dependent: :destroy
end
