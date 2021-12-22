class Cake < ApplicationRecord
  validates :name, presence: true



  def to_s
    "id: #{id} /name: #{name} /descripion: #{description} /price: #{price} /size: #{size}"
  end

  def personnes
    " personnes"
  end

  def currency
    " EUR"
  end

  def priced
    number_with_precision(price, precision: 2)
  end
end
