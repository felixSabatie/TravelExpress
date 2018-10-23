class CreatePassengersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers_tables do |t|
      t.references :account, foreign_key:true, index:true
      t.references :lift, foreign_key:true, index:true
    end
  end
end
