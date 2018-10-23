class CreatePassengersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers_tables do |t|
      t.belongs_to :account
      t.belongs_to :lift
    end
  end
end
