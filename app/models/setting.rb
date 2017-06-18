class Setting
	def self.get(attr_name)
		config_path = "#{Rails.root}/config/setting.yml"
		app_config = YAML.load_file(config_path)[Rails.env]
		app_config[attr_name.to_s]
	end
end