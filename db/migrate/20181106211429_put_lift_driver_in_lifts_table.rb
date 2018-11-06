class PutLiftDriverInLiftsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :drivers
    add_reference :lifts, :account, foreign_key: true
  end
end
