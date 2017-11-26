require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "validates name presence" do
    person = Person.new
    person.valid?
    assert person.errors.added?(:name, :blank)
  end

  test "validates tax_id presence" do
    person = Person.new
    person.valid?
    assert person.errors.added?(:tax_id, :blank)
  end

  test "validates email presence" do
    person = Person.new
    person.valid?
    assert person.errors.added?(:email, :blank)
  end
end
