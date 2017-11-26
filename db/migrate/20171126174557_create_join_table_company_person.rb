class CreateJoinTableCompanyPerson < ActiveRecord::Migration[5.1]
  def change
    create_join_table :companies, :people do |t|
      t.index [:company_id, :person_id]
    end
  end
end
