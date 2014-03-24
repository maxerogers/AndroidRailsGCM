class PushController < ApplicationController
  def broadcast
  	destinations = Device.select('distinct regid').map(&:regid)
  	logger.info "SENDING send_notification "+params[:q]
  	GCM.send_notification( destinations, { message: params[:q]})
  end
end
