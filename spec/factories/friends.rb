FactoryBot.define do
  factory :friend do
    from_id {FactoryBot.create(:user).id}
    to_id   {FactoryBot.create(:user).id}
  end
end
