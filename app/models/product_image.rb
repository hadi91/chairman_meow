class ProductImage < ApplicationRecord
  belongs_to :product

  validates :imageurl, presence: true
end
