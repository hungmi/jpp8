require "rails_helper"

RSpec.describe Product, :type => :model do
	it "出生的時候沒問題" do
    expect(build(:product)).to be_valid
	end
  it "中文名字或外文名字必須要有一個" do
    product = Product.new(foreign_name: nil, tw_name: nil)
    product.valid?
    expect(product.errors[:tw_name]).to include ("中文名字或外文名字必須要有一個")
    expect(product.errors[:foreign_name]).to include ("中文名字或外文名字必須要有一個")
  end
  it "必須要有批發價格" do
  	product = Product.new(ws_price: nil)
    product.valid?
    expect(product.errors[:ws_price]).to include ("can't be blank")
  end
  it "若有建議售價，需比批發價高" do
  	price = 99
  	product = Product.new(rr_price: price, ws_price: price + 1)
  	product.valid?
  	expect(product.errors[:rr_price]).to include ("建議售價不可低於批發價")
  end

 	it "必須屬於一個目錄" do
    product = Product.new(category: nil)
    product.valid?
    expect(product.errors[:category]).to include ("must exist")
  end
end