class ProductForm

  include ActiveModel::Model

  attr_reader :product

  delegate :attributes=, to: :product, prefix: true

  validate :product_is_valid?

  def initialize(product, params = {})
    @product = product
    super(params)
  end

  def save
    if valid?
      @product.save
    else
      false
    end
  end

  private

  def product_is_valid?
    errors.add(:base, 'invalid product') unless product.valid?
  end

end
