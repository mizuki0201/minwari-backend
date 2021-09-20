class Event < ApplicationRecord
  belongs_to :group
  has_many :expences
  has_many :debts

  validates :title, { presence: true, length: { maximum: 50 } }
  validates :description, { length: {maximum: 100} }
end