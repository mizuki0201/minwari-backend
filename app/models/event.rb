class Event < ApplicationRecord
  belongs_to :group
  has_many :expences
  has_many :debts

  validates :title, presence: true
end