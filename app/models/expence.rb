class Expence < ApplicationRecord
  belongs_to :group
  belongs_to :event
  belongs_to :user
  has_many :debts, dependent: :destroy

  # 支出情報にユーザー名を付与する
  def add_username_to_expence
    new_expence = self.attributes
    new_expence['user_name'] = User.find(self.user_id).attributes['name']
    return new_expence
  end
end
