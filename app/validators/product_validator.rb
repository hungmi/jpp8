class ProductValidator < ActiveModel::Validator
  def validate(product)
    unless (product.tw_name.present? || product.foreign_name.present?)
      product.errors[:tw_name] << '中文名字或外文名字必須要有一個'
      product.errors[:foreign_name] << '中文名字或外文名字必須要有一個'
    end
    if product.rr_price.present? && product.ws_price.present?
    	unless product.rr_price > product.ws_price
    		product.errors[:rr_price] << '建議售價不可低於批發價'
    	end
    end
  end
end