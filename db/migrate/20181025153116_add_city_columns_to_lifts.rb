class AddCityColumnsToLifts < ActiveRecord::Migration[5.2]
  def change
    change_table :lifts do |t|
      t.string :departure_city
      t.string :arrival_city
    end
  end
end
