class Product < ApplicationRecord
	validates :ws_price, presence: true
	belongs_to :category
	has_many :product_sources
	has_many :sources, through: :product_sources

	validates_with ProductValidator
end