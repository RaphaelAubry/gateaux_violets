class Cake < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :lines

  has_one_attached :photo

  include AlgoliaSearch

  algoliasearch do

  end

  def to_s
    "id: #{id} /name: #{name} /descripion: #{description} /price: #{price} /size: #{size}"
  end
end
