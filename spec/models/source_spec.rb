require 'rails_helper'

RSpec.describe Source, type: :model do
  it "必須要有名字" do
  	source = build(:source, name: nil)
    source.valid?
    expect(source.errors[:name]).to include ("不可空白")
  end
  it "必須至少屬於一個商品" do
    source = build(:source_with_products)
    source.valid?
    expect(source.errors[:products]).to include ("商品來源須至少屬於一個商品")
  end
end
