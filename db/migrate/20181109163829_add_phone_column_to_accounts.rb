class AddPhoneColumnToAccounts < ActiveRecord::Migration[5.2]
  def change
    change_table :accounts do |t|
      t.string :phone
    end
  end
end
