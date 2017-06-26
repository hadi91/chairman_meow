require 'rails_helper'

RSpec.describe Admin, type: :model do

  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
  it { should validate_presence_of(:username) }

  describe 'validates uniqueness of username' do
    subject { Admin.create(firstname: 'John', lastname: 'Doe', username: 'JohnDoe') }
    it { should validate_uniqueness_of(:username).case_insensitive }
  end
end
