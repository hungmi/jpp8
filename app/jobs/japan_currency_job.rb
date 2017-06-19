class JapanCurrencyJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	doc = Nokogiri::HTML(open("http://rate.bot.com.tw/xrt?Lang=zh-TW"))
  	begin
  		today_currency = doc.at(".currency :contains('JPY')").ancestors("tr").at("[data-table='本行現金賣出']").text
  		return today_currency
  	rescue => ex
  		logger.error ex.message
  	end
  end
end
