require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #index' do

    let!(:products) { create_list(:product, 3) }

    before { get :index }

    it { expect(assigns(:products)).to eq(products) }
    it { expect(Product.count).to eq(3) }

  end

end
