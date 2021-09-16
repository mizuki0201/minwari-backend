FactoryBot.define do
  factory :event do
    title       {Faker::Hobby.activity}
    description {Faker::Hobby.activity}
    association :group
  end
end
