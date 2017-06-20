class User < ApplicationRecord

  after_create :create_shopping_cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :orders, dependent: :destroy
  has_one  :shopping_cart, dependent: :destroy

  validates :firstname,        presence: true
  validates :lastname,         presence: true
  validates :username,         presence: true, uniqueness: { case_sensitive: false }
  validates :telephone_number, presence: true
  validates :address,          presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.firstname = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.provider = "facebook"
        user.uid = data["id"] if user.uid.blank?
        user.email = data["email"] if user.email.blank?
        user.firstname = data["name"] if user.firstname.blank?
      end
    end
  end

  private

  def create_shopping_cart
    ShoppingCart.create(user: self)
  end

end
