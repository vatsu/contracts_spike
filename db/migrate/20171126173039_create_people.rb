class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :tax_id
      t.string :email

      t.timestamps
    end
  end
end
