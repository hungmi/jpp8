FactoryGirl.define do
  factory :user do
  	phone "09#{Faker::Number.number(8)}"
  	password Faker::Number.number(10)
  end
end