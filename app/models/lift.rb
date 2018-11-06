class Lift < ApplicationRecord
  has_and_belongs_to_many :rules

  belongs_to :driver, :class_name => :Account, :foreign_key => "account_id"

  has_many :passengers
  has_many :accounts, through: :passengers

  validates :departure_address, presence: true
  validates :arrival_address, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true
  validates :car, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :capacity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :departure_date, presence: true # TODO validate is date
  validates :arrival_date, presence: true   # TODO validate is date

end
