class Source < ApplicationRecord
	has_many :product_sources
	has_many :products, through: :product_sources
	validates :name, :products, presence: true
end
