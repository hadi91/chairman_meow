class Order < ApplicationRecord

  belongs_to :user

  has_many :line_items, dependent: :destroy

  validates :orderstatus, presence: true

  enum orderstatus: {
    "New":                0,
    "Pending Payment":    1,
    "Payment Approved":   2,
    "Awaiting Pickup":    3,
    "Shipped":            4,
    "Delivered":          5,
    "Disputed":           6,
    "Refunded":           7,
    "Cancelled":          8
  }

end
