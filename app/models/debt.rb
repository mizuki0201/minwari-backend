class Debt < ApplicationRecord
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"
  belongs_to :group
  belongs_to :event
  belongs_to :expence

  validates :price, numericality: { greater_than: 0 }

  # グループに紐づく借金データを全取得
  def self.get_debt_with_group(group_id, user_id)
    return Debt.where(group_id: group_id, to_id: user_id)
  end

  # イベントに紐づく借金データを全取得
  def self.get_debt_with_event(event_id, user_id)
    return Debt.where(event_id: event_id, to_id: user_id)
  end

  # 支出に紐づく借金データを全取得
  def self.get_debt_with_expence(expence_id, user_id)
    return Debt.where(expence_id: expence_id, to_id: user_id)
  end
end
