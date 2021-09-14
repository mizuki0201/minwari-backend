class ExpenceDebtForm
  include ActiveModel::Model
  attr_accessor :title, :description, :price, :event_id, :user_id, :group_id

  validates :title, :event_id, :user_id, :group_id, presence: true
  validates :price, numericality: true

  def save
    ActiveRecord::Base.transaction do
      expence = Expence.create!({
        title: title,
        description: description,
        price: price,
        event_id: event_id,
        user_id: user_id
      })
      members = Group.find(group_id).users
      # あとで小数点の計算を考慮した記述にする
      debt_price = expence.price / members.length
      
      debts = []
      members.each do |member|
        next if member.id === expence.user_id
        debt = Debt.create!({
          price: debt_price,
          from_id: expence.user_id,
          to_id: member.id,
          expence_id: expence.id,
          event_id: event_id,
          group_id: group_id
        })

        debts << debt
      end

      return {expence: expence, debts: debts}
    end
  end
end