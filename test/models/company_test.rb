require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "validates name presence" do
    company = Company.new
    company.valid?
    assert company.errors.added?(:name, :blank)
  end

  test "validates tax_id presence" do
    company = Company.new
    company.valid?
    assert company.errors.added?(:tax_id, :blank)
  end

  test "validates people length (minium 1 person)" do
    company = Company.new
    company.valid?
    assert company.errors.added?(:people, "has to have one or two people associated with.")
  end

  test "validates people length (maximum 2 people)" do
    company = Company.new
    company.people = [ people(:person_one),
                       people(:person_two),
                       people(:person_three) ]
    company.valid?
    assert company.errors.added?(:people, "has to have one or two people associated with.")
  end
end
