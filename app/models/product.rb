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
    "Female": 0,
    "Male": 1
  }

  scope :premium, -> { where("price > ?", 3000) }

  def self.search(search_term)
    if search_term
      search_term.downcase!
      where('breed ILIKE ?', "%#{search_term}%")
    else
      all
    end
  end
end
