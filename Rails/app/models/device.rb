class Device < ActiveRecord::Base
	def log
		@@log ||= Logger.new("#{Rails.root}/log/device.log")
	end
end
