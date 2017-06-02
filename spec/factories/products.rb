FactoryGirl.define do
  factory :product do
    tw_name "一個假名字"
    foreign_name "名前"
    category
    price = 999
    rr_price price
    ws_price price - 1
    stock 10
    factory :product_with_sources do
    	after(:create) do |product, evaluator|
        create_list(:source, 3, product: product)
      end
    end
  end
end