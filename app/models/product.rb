class Product < ApplicationRecord
	validates :ws_price, presence: true
	belongs_to :category
	# belongs_to :shop

	validates_with ProductValidator
end