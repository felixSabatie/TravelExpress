class Lift < ApplicationRecord
  has_and_belongs_to_many :rules

  has_and_belongs_to_many :drivers, :class_name => 'Account', :join_table => 'drivers'
  has_and_belongs_to_many :passengers, :class_name => 'Account', :join_table => 'passengers'

end
