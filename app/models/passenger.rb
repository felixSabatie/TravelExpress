class Passenger < ApplicationRecord

  belongs_to :lift
  belongs_to :account

  validates :seats, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

end