class Expence < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :title, presence: true
  validates :price, numericality: true
end
