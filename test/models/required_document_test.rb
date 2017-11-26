require 'test_helper'

class RequiredDocumentTest < ActiveSupport::TestCase
  test "validates description presence" do
    required_document = RequiredDocument.new
    required_document.valid?
    assert required_document.errors.added?(:description, :blank)
 end
end
