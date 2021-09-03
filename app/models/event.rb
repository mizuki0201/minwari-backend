class Event < ApplicationRecord
  belongs_to :group
  has_many :expences
  has_many :debts

  validates :title, :date, presence: true
end