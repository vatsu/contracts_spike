class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.integer :status
      t.references :product, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
