class JapanCurrencyJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	doc = Nokogiri::HTML.parse( Net::HTTP.get( URI.parse("http://rate.bot.com.tw/xrt?Lang=zh-TW") ) )
  	begin
  		today_currency = doc.at(".currency :contains('JPY')").ancestors("tr").at("[data-table='本行現金賣出']").text
      p "已成功抓取匯率 at #{Time.current}"
  		return today_currency
  	rescue => ex
  		logger.error ex.message
  	end
  end
end
