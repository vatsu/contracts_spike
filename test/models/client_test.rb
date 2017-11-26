require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "segment cannot be blank" do
    client = Client.new
    client.valid?
    assert client.errors.added?(:segment, :blank)
  end

  test "company cannot be blank if its segment is company" do
    client = Client.new
    client.segment = "company"
    client.valid?
    assert client.errors.added?(:company, :blank)
  end

  test "person cannot be blank if its segment is person" do
    client = Client.new
    client.segment = "person"
    client.valid?
    assert client.errors.added?(:person, :blank)
  end

  test "signatories should fetch a array with the associated person if its segment is person" do
    client = Client.new
    client.segment = "person"
    client.person = people(:person_one)
    signatories = client.signatories
    assert signatories == [people(:person_one)]
  end

  test "signatories should fetch a array with people associated with the company if its segment is company" do
    client = Client.new
    client.segment = "company"
    client.company = companies(:company_two)
    signatories = client.signatories
    assert signatories == companies(:company_two).people
  end

  test "name should fetch company's name if its segment is company" do
    client = Client.new
    client.segment = "company"
    client.company = companies(:company_two)
    assert client.name == companies(:company_two).name
  end

  test "name should fetch person's name if its segment is person" do
    client = Client.new
    client.segment = "person"
    client.person = people(:person_one)
    assert client.name == people(:person_one).name
  end

  test "tax_id should fetch company's tax_id if its segment is company" do
    client = Client.new
    client.segment = "company"
    client.company = companies(:company_two)
    assert client.tax_id == companies(:company_two).tax_id
  end

  test "tax_id should fetch person's tax_id if its segment is person" do
    client = Client.new
    client.segment = "person"
    client.person = people(:person_one)
    assert client.tax_id == people(:person_one).tax_id
  end
end
