require 'rails_helper'

RSpec.describe JapanCurrencyJob, type: :job do
	it "會得到一個浮點數字串，因此轉換前後應該長度一樣" do
		require "open-uri"
		require "Nokogiri"
	  result = JapanCurrencyJob.new.perform
	  expect(result.to_f.to_s.size).to equal(result.size)
	end
end
