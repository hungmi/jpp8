module Admin::ProductsHelper
	def short_input_with_number_pad(form, attr_sym)
		render partial: "admin/partials/short_input_with_number_pad", locals: { f: form, attr_sym: attr_sym }
	end
end