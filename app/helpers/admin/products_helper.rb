module Admin::ProductsHelper
	def short_input_with_number_pad(form, attr_sym)
		render partial: "admin/partials/short_input_with_number_pad", locals: { f: form, attr_sym: attr_sym }
	end

	def number_pad_input(attr_sym, form = nil)
		if form.present?
			if os?("android")
	    	form.input_field attr_sym, class: "form-control", type: :tel, pattern: "[0-9]*"
	    else
	    	form.input_field attr_sym, class: "form-control", type: :text, pattern: "\\d*"
	    end
	  else
			if os?("android")
				text_field_tag attr_sym, nil, class: "form-control", type: :tel, pattern: "[0-9]*"
			else
				text_field_tag attr_sym, nil, class: "form-control", type: :text, pattern: "\\d*"
			end
	  end
	end
end