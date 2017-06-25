class Admin < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname,        presence: true
  validates :lastname,         presence: true
  validates :username,         presence: true, uniqueness: { case_sensitive: false }

end
