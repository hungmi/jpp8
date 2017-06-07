class Admin::ProductsController < AdminController
	def new
		@title = "建立新商品"
		@product = Product.new
	end

	def index
		@title = "商品資料庫"
	end
end