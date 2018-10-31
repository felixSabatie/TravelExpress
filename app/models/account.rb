class Account < ApplicationRecord
  has_and_belongs_to_many :drivers, :class_name => 'Lift', :join_table => 'drivers'
  has_and_belongs_to_many :passengers, :class_name => 'Lift', :join_table => 'passengers'

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  validates :password, presence: true
  validates_confirmation_of :password
  validates_presence_of :password_confirmation, if: :password_changed?
end
