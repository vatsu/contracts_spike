class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :segment

      t.timestamps
    end
    add_index :products, [:name, :segment], unique: true
  end
end
