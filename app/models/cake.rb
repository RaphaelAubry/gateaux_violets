class Cake < ApplicationRecord
  validates :name, presence: true

  def to_s
    "id: #{id} /name: #{name} /descripion: #{description} /price: #{price} /size: #{size}"
  end
end
