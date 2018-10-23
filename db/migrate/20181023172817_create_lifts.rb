class CreateLifts < ActiveRecord::Migration[5.2]
  def change
    create_table :lifts do |t|
      t.string :departure_address
      t.string :arrival_address
      t.string :car
      t.decimal :price, precision: 5, scale: 2
      t.integer :capacity
      t.datetime :departure_date
      t.datetime :arrival_date

      t.timestamps
    end
  end
end
