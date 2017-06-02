FactoryGirl.define do
  factory :source do
    name "A fake name"
    description "A long description."
    factory :source_with_products do
    	after(:create) do |source, evaluator|
        create_list(:product, 3, source: source)
      end
    end
  end
end
