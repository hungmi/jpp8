class ProductSource < ApplicationRecord
	belongs_to :product
	belongs_to :source
end