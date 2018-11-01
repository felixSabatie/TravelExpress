class FixAccountColumnName < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :accounts, :password, :password_digest
    remove_column :accounts, :email
    add_column :accounts, :email, :string, unique: true
  end

  def self.down
    rename_column :accounts, :password_digest, :password
    remove_column :accounts, :email
    add_column :accounts, :email, :string
  end
end