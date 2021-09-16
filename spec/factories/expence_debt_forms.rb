FactoryBot.define do
  factory :expence_debt_form do
    title       {Faker::Hobby.activity}
    description {Faker::Hobby.activity}
    price       {Faker::Number.number(digits: 4)}
    group_id    {FactoryBot.create(:group)}
    event_id    {FactoryBot.create(:event)}
    user_id     {FactoryBot.create(:user)}
  end
end
