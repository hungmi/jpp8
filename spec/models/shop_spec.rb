require 'rails_helper'

RSpec.describe Shop, type: :model do
  it "必須要有名字" do
  	shop = Shop.new(name: nil)
    shop.valid?
    expect(shop.errors[:name]).to include ("can't be blank")
  end
end
