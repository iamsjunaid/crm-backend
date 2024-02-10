class Customer < ApplicationRecord
  has_many :contacts

  validates :name, presence: true
  validates :email, presence: true
end
