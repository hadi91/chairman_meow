class ShoppingCart < ApplicationRecord
  belongs_to :user, optional: true

  has_many :line_items

  def total_price
    total_price = line_items.map do |line_item|
      line_item.product.price * line_item.quantity
    end.reduce(:+)

    total_price.nil? ? 0 : '%.2f' % total_price
  end

  def total_quantity
    line_items.count
  end
end
