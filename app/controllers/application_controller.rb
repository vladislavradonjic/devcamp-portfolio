class ApplicationController < ActionController::Base
	#skip_before_action :verify_authenticity_token
	protect_from_forgery with: :exception
	include DeviseWhitelist
	include SetSource
	include CurrentUserConcern
	include DefaultPageContent
end