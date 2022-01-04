class Cake < ApplicationRecord
  validates :name, presence: true

  has_many :lines

  def to_s
    "id: #{id} /name: #{name} /descripion: #{description} /price: #{price} /size: #{size}"
  end

end
