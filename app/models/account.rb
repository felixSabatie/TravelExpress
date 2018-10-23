class Account < ApplicationRecord
  has_and_belongs_to_many :drivers, :class_name => 'Lift', :join_table => 'drivers'
  has_and_belongs_to_many :passengers, :class_name => 'Lift', :join_table => 'passengers'
end
