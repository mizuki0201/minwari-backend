class Expence < ApplicationRecord
  belongs_to :group
  belongs_to :event
  belongs_to :user
  has_many :debts, dependent: :destroy
end
