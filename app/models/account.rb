class Account < ApplicationRecord
  has_and_belongs_to :drivers, :class_name => 'Lift', :join_table => 'drivers'
  has_and_belongs_to :passengers, :class_name => 'Lift', :join_table => 'passengers'
end
