class Interaction < ApplicationRecord
  belongs_to :contact

  validates :text, presence: true
end
