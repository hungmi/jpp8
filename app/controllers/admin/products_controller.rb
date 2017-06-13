class Admin::ProductsController < AdminController
	before_action :set_product, only: [:edit, :update, :show, :destroy]
	def new
		@title = "建立新商品"
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to [:admin, @product]
		else
			render :new
		end
	end

	def edit
		@title = "編輯商品資料"
	end

	def update
		if @product.update(product_params)
			redirect_to [:admin, @product]
		else
			render :edit
		end
	end

	def index
		@turbolinks_cache_control = 'no-preview'
		@title = "商品資料庫"
		# TODO 此處排序無用，因為會被 dataTable 取代
		@products = Product.includes(:category).all.order("updated_at DESC")
	end

	def show
	end

	private
		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:tw_name, :foreign_name, :rr_price, :ws_price, :stock, :category_id, :description, :shipping_weight, :origin, :material, :item_code, :product_size)
		end
end