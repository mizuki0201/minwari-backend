class FriendRequest < ApplicationRecord
  belongs_to :from_id, class_name: "User"
  belongs_to :to_id, class_name: "User"
end
