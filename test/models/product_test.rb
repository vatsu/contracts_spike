require 'test_helper'

class ProductTest < ActiveSupport::TestCase
   test "validates name and segment presence" do
     product = Product.new
     product.valid?
     assert product.errors.added?(:name, :blank) && product.errors.added?(:segment, :blank)
  end

  test "validates name, in segment scope, uniquess" do
    product = products(:one).dup
    product.valid?
    assert product.errors.added?(:name, :taken)
 end
end
