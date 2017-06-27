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

  scope :neworders,       ->{ where(orderstatus:0)}
  scope :pendingpayment,  ->{ where(orderstatus:1)}
  scope :paymentapproved, ->{ where(orderstatus:2)}
  scope :awaitingpickup,  ->{ where(orderstatus:3)}
  scope :shipped,         ->{ where(orderstatus:4)}
  scope :delivered,       ->{ where(orderstatus:5)}
  scope :disputed,        ->{ where(orderstatus:6)}
  scope :refunded,        ->{ where(orderstatus:7)}
  scope :cancelled,       ->{ where(orderstatus:8)}


  #def self.search(search)
  #  where("orderstatus ILIKE ?", "%#{search}%")
  #end
end
