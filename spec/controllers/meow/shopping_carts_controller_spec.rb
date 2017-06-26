require 'rails_helper'

RSpec.describe Meow::ShoppingCartsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #show' do

    let!(:line_items) { create_list(:line_item, 3, shopping_cart: user.shopping_cart) }

    before { get :show }

    it { expect(assigns(:shopping_cart)).to eq(user.shopping_cart) }
    it { expect(assigns(:line_items)).to eq(line_items) }

  end

end
