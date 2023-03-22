class Cake < ApplicationRecord
  validates :name, presence: true, format: { with: /[A-Z]/ } #start with uppercase
  validates :price, presence: true

  has_many :lines

  has_one_attached :photo

  def to_s
    "id: #{id} /name: #{name} /descripion: #{description} /price: #{price} /size: #{size}"
  end

  def active?
    return true if active
  end
end
