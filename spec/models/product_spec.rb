require 'rails_helper'

RSpec.describe Product, type: :model do

  it { should have_many(:line_items) }
  it { should have_many(:product_images).dependent(:destroy) }

  it { should validate_presence_of(:breed) }
  it { should validate_presence_of(:dob) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:quantity) }

  it { should define_enum_for(:gender) }

end
