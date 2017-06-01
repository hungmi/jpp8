require "rails_helper"

RSpec.describe Category, :type => :model do
  it "必須要有名字" do
  	category = Category.new(name: nil)
    category.valid?
    expect(category.errors[:name]).to include ("can't be blank")
  end

  it "擁有許多商品" do
  	expect(Category.reflect_on_association(:products).macro).to eq(:has_many)
 	end
end