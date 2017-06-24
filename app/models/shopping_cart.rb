class ShoppingCart < ApplicationRecord
  belongs_to :user, optional: true

  has_many :line_items, dependent: :destroy
end
