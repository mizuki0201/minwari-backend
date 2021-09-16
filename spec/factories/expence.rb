FactoryBot.define do
  factory :expence do
    title       {Faker::Hobby.activity}
    description {Faker::Hobby.activity}
    price       {Faker::Number.number(digits: 4)}
    association :group
    association :event
  end
end
