class Interaction < ApplicationRecord
  belongs_to :contact
  belongs_to :customer

  validates :content, presence: true
end
