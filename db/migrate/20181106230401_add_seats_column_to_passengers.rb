class AddSeatsColumnToPassengers < ActiveRecord::Migration[5.2]
  def change
    change_table :passengers do |t|
      t.integer :seats
    end
  end
end
