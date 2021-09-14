class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :events
  has_many :expences
  has_many :debts

  validates :name, presence: true
end
