require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:telephone_number) }
  it { should validate_presence_of(:address) }

  describe "validates uniqueness of username" do
    subject { User.create(firstname: "Bob", lastname: "Martin", username: "Bobmartin", address: "123 Tanjong Pagar Rd", telephone_number: "81271626")}
    it { should validate_uniqueness_of(:username).case_insensitive }
  end

end
