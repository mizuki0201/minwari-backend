class Event < ApplicationRecord
  has_many :groups

  validates :title, :date, presence: true
end