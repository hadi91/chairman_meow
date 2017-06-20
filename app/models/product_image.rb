class ProductImage < ApplicationRecord
  belongs_to :product

  validates :image_url, presence: true
end
