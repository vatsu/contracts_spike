require 'test_helper'

class ContractTest < ActiveSupport::TestCase
  test "should set status to awaiting_signatures if status is nil" do
    contract = contracts(:one).dup
    contract.status = nil
    contract.save
    assert contract.awaiting_signatures?
  end

  test "validates if client and product have the same segment" do
    contract = Contract.new

    contract.product = products(:product_one)
    contract.product.segment = "person"

    contract.client = clients(:client_one)
    contract.client.segment = "company"

    contract.valid?
    assert contract.errors.added? :client, "client and product must have the same segment"
  end
end
