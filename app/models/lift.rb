class Lift < ApplicationRecord
  has_and_belongs_to_many :rules

  has_and_belongs_to :drivers, :class_name => 'Account', :join_table => 'drivers'
  has_and_belongs_to :passengers, :class_name => 'Account', :join_table => 'passengers'
end
