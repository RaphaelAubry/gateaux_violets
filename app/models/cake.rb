class Cake < ApplicationRecord
  validates :name, presence: true

  include ActionView::Helpers::NumberHelper

  def to_s
    "id: #{id} /name: #{name} /descripion: #{description} /price: #{price} /size: #{size}"
  end

  def personnes
    " personnes"
  end

  def currency
    " EUR"
  end

  def price_2d
    number_with_precision(price, precision: 2)
  end
end
