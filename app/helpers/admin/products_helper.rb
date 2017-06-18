module Admin::ProductsHelper
	def short_input_with_number_pad(form, attr_sym)
		render partial: "admin/partials/short_input_with_number_pad", locals: { f: form, attr_sym: attr_sym }
	end

	def number_pad_input(attr_sym, form = nil, html_options = nil)
		options = if os?("android")
			{ class: "form-control", type: :tel, pattern: "[0-9]*" }
		else
			{ class: "form-control", type: :text, pattern: "\\d*" }
		end.merge(html_options.to_h)

		if form.present?
	    	form.input_field attr_sym, options
		else
			text_field_tag attr_sym, nil, options
		end
	end
end