class Lift < ApplicationRecord
  has_and_belongs_to_many :rules

  has_and_belongs_to_many :drivers, :class_name => 'Account', :join_table => 'drivers'
  has_and_belongs_to_many :passengers, :class_name => 'Account', :join_table => 'passengers'

  validates :departure_address, presence: true    # TODO validate is date
  validates :arrival_address, presence: true      # TODO validate is date
  validates :car, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :capacity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :departure_date, presence: true
  validates :arrival_date, presence: true

end
