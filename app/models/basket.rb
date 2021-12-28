class Basket < ApplicationRecord
  belongs_to :user
  belongs_to :cake
end
