require 'rails_helper'

RSpec.describe LineItem, type: :model do

  # shouldamatchers does not have a matcher for optional: true
  it { should belong_to(:shopping_cart) }
  it { should belong_to(:product) }
  it { should belong_to(:order) }

  it { should validate_presence_of(:quantity) }

end
