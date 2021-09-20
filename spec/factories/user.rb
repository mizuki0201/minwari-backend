FactoryBot.define do
  factory :user do
    name      {Faker::Name.name}
    user_id   {Faker::Internet.password(min_length: 4)}
    email     {Faker::Internet.free_email}
    phone     {Faker::Number.number(digits: 11)}
    password  {Faker::Internet.password(min_length: 6)}
  end
end