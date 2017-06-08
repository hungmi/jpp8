class Admin::DashboardsController < AdminController
	def home
		@title = "主控台"
		@pie_example_data = {
			"red": 20,
			"black": 30,
			"green": 40
		}
	end
end