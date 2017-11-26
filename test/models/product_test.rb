require 'test_helper'

class ProductTest < ActiveSupport::TestCase
   test "validates name and segment presence" do
     product = Product.new
     product.valid?
     assert product.errors.added?(:name, :blank) && product.errors.added?(:segment, :blank)
  end

  test "validates name, in segment scope, uniquess" do
    product = products(:product_one).dup
    product.valid?
    assert product.errors.added?(:name, :taken)
  end

  test "required_document is optional" do
    product = Product.new
    product.valid?
    assert_not product.errors.added?(:required_document, :blank)
  end
end
