class AddRequiredDocumentToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :required_document, foreign_key: true
  end
end
