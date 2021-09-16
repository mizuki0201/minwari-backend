FactoryBot.define do
  factory :debt do
    price   {Faker::Number.number(digits: 4)}
    from_id {FactoryBot.create(:user).id}
    to_id   {FactoryBot.create(:user).id}
    association :group
    association :event
    association :expence 
  end
end
