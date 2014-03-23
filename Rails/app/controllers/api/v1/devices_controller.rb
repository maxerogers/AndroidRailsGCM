module Api
	module V1
		class DevicesController < ApplicationController
			respond_to :json

			def index
				respond_with Device.all
			end

			def show 
				respond_with Device.find(params[:id])
			end

			def create
				respond_with Device.create(params[:device])
			end

			def test
				logger.info "This is a test "+params.inspect
				render json: {message: "This is a test", params: params.inspect}
				@str = params[:regId]
				#str = "APA91bH4RfAR45WvoV0-Zvjot7Czha1UwyCLkjnB7CtDhhH-XHuLUOEnJ5qL9KpN1H0BVSnWG-DNjlM3ZAnOcAvFqaM0qyCCSRheaNOppuj5WIO-9l7OB-UDb4LDFo7V6jSs-Uc7fwYZCWGEAgKD4kew1Y60aCV5Ww"
				@d = Device.where(regid: @str).first
				@d ||= Device.create(regid: @str)

				GCM.send_notification( @d.regid , {message: params.inspect} )
			end

		end	
	end
end
