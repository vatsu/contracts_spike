class AddDocumentToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :document, :string
  end
end
