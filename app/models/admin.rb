class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname,        presence: true
  validates :lastname,         presence: true
  validates :username,         presence: true, uniqueness: { case_sensitive: false }
  validates :email,            presence: true
  validates :address,          presence: true
end
