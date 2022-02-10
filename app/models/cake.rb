class Cake < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true, numericality: { other_than: 0 }

  has_many :lines

  has_one_attached :photo

  include AlgoliaSearch

  algoliasearch do
     attributes :name, :description, :price, :size
  end

  def to_s
    "id: #{id} /name: #{name} /descripion: #{description} /price: #{price} /size: #{size}"
  end

  def active?
    return true if active
  end
end
