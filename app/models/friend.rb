class Friend < ApplicationRecord
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"

  # from_idがログインユーザーで、その友達のユーザー情報をto_idから取得
  def self.get_friends_with_from_id(user_id)
    friends_from = Friend.where(from_id: user_id)
    friends = friends_from.map do |friend|
      user_from = User.find(friend[:to_id])
      user_from
    end

    return friends
  end

  # to_idがログインユーザーで、その友達のユーザー情報をfrom_idから取得
  def self.get_friends_with_to_id(user_id)
    friends_to = Friend.where(to_id: user_id)
    friends = friends_to.map do |friend|
      user_to = User.find(friend[:from_id])
      user_to
    end

    return friends
  end
end
