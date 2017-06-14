module ApplicationHelper
	def turbolinks_cache_control_meta_tag
	  tag :meta, name: 'turbolinks-cache-control', content: @turbolinks_cache_control || 'cache'
	end

	def os?(os_name)
		DeviceDetector.new(request.user_agent).os_name.downcase.include? os_name
	end
end
