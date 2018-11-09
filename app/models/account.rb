class Account < ApplicationRecord

  has_many :passengers
  has_many :lifts, through: :passengers

  has_many :drivers, class_name: 'Lift'

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  has_secure_password
end
