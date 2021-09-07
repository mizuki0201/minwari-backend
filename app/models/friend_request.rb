class FriendRequest < ApplicationRecord
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"
end
