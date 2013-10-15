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

  trait :with_image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'sample.jpg')) }
  end
end
