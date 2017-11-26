class CreateRequiredDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :required_documents do |t|
      t.string :description

      t.timestamps
    end
  end
end
