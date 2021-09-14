class Debt < ApplicationRecord
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"
  belongs_to :group
  belongs_to :event
  belongs_to :expence

  validates :price, numericality: true
end
