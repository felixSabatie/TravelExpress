class CreateDriversTable < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.references :account, foreign_key:true, index:true
      t.references :lift, foreign_key:true, index:true
    end
  end
end
