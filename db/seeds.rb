["食物", "衣服", "餅乾", "生活用品"].each do |category_name|
	Category.create({ name: category_name })
end
3000.times do
	price = rand(100..999).to_i
	categories_num = Category.all.size
	Product.create({
		tw_name: "一個很棒的產品#{rand(10..99)}",
    foreign_name: "あいうえお#{rand(10..99)}",
    category: Category.find(rand(1..categories_num)),
    rr_price: price,
    ws_price: price - 1,
    shipping_weight: rand(1..9).to_i * 10,
    stock: rand(1..10)
	})
end