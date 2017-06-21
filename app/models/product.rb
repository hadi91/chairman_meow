class Product < ApplicationRecord

  has_many :line_items,     dependent: :destroy
  has_many :product_images, dependent: :destroy

  validates :breed,       presence: true
  validates :dob,         presence: true
  validates :description, presence: true
  validates :price,       presence: true
  validates :gender,      presence: true
  validates :quantity,    presence: true


  enum gender: {
    "female": 0,
    "male": 1
  }

end
