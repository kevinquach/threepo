FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password '12345678'
  end

  factory :design do
    sequence(:title) { |n| "Design #{n}" }
    description 'Funky design'
    user
  end
end
