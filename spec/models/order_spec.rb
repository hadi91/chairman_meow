require 'rails_helper'

RSpec.describe Order, type: :model do

  it { should belong_to(:user) }

  it { should have_many(:line_items) }

  it { should validate_presence_of(:orderstatus) }

  it { should define_enum_for(:orderstatus) }

end
