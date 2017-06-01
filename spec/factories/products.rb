FactoryGirl.define do
  factory :product do
    tw_name Faker::Name.name
    foreign_name Faker::Name.name
    category
    price = Faker::Number.number(4)
    rr_price price
    ws_price price.to_i - 1
    stock Faker::Number.number(2)
  end
end