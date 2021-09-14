class Expence < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :debts, dependent: :destroy

  validates :title, presence: true
  validates :price, numericality: true
end
