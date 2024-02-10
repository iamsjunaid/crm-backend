class Contact < ApplicationRecord
  belongs_to :customer
  has_many :interactions

  validates :name, presence: true
  validates :email, presence: true
end