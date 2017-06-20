class LineItem < ApplicationRecord

  belongs_to :shopping_cart, optional: true
  belongs_to :product
  belongs_to :order, optional: true

  validates :quantity, presence: true

end
