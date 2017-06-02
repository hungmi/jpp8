require "rails_helper"

RSpec.describe User, :type => :model do
  it "必須要有手機號" do
    user = User.new(phone: nil)
    user.valid?
    expect(user.errors[:phone]).to include ("不可空白")
  end
  it "必須要有密碼" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include ("不可空白")
  end

  it "只能使用正確的密碼驗證" do
  	user = build(:user, password: "123456")
  	expect(user.authenticate("123456")).to eq user
  	expect(user.authenticate("incorrect password")).to be false
  end
end