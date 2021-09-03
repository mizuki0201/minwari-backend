class Event < ApplicationRecord
  belongs_to :group
  has_many :expences

  validates :title, :date, presence: true
end