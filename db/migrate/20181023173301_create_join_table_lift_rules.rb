class CreateJoinTableLiftRules < ActiveRecord::Migration[5.2]
  def change
    create_join_table :lifts, :rules do |t|
      t.references :lift, index:true, foreign_key:true
      t.references :rule, index:true, foreign_key:true
    end
  end
end
