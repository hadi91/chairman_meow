require 'rails_helper'

RSpec.describe ProductImage, type: :model do

  it { should belong_to(:product) }

  it { should validate_presence_of(:imageurl) }

end
