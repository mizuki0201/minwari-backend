class Expence < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :title, :price, presence: true
  validates :price, numericality: true
end
