class Interaction < ApplicationRecord
  belongs_to :contact

  validates :content, presence: true
end
