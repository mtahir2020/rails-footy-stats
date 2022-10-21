class Player < ApplicationRecord
  belongs_to :club
  validates :name, :goals, presence: true
  validates :goals, numericality: { only_integer: true}
end
