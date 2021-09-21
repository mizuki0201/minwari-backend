class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :events
  has_many :expences
  has_many :debts

  validates :name, { presence: true, length: { maximum: 50 } }

  # グループに入ってるユーザーを取得
  def get_members
    return self.users.select(:id, :name)
  end
end
