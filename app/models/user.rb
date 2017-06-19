class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :orders
  # has_one :cart

  validates :firstname,        presence: true
  validates :lastname,         presence: true
  validates :username,         presence: true, uniqueness: { case_sensitive: false }
  validates :telephone_number, presence: true
  validates :address,          presence: true

end
