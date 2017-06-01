require "rails_helper"

RSpec.describe User, :type => :model do
  it "必須要有手機號跟密碼" do
    user = build(:user)
    user_without_phone = build(:user, phone: nil)
    user_without_password = build(:user, password: nil)

    expect(user.valid?).to be true
    expect(user_without_phone.valid?).to be false
    expect(user_without_password.valid?).to be false
  end

  it "只能使用正確的密碼驗證" do
  	user = build(:user, password: "123456")
  	expect(user.authenticate("123456")).to eq user
  	expect(user.authenticate("incorrect password")).to be false
  end
end