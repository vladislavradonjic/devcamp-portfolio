module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		super || guest_user
	end

	def guest_user
		OpenStruct.new(	name: "Guest Usr", 
										first_name: "Guest", 
										last_name: "Usr", 
										email: "smthng@norealdomen.com"	)
	end

end