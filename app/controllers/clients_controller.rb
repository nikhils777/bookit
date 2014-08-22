class ClientsController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.role == "business"
      redirect_to root_path, notice: "Your account is not authorized for that section of the website!"
    end
    @businesses = User.all.where( role: "business")
    @allbookings = Booking.all.where( user_id: current_user.id )
    @bookings = Booking.all.where( user_id: current_user.id , confirmed: false)
    @confbookings = Booking.all.where( user_id: current_user.id , confirmed: true)
    @message = Message.new
    
    @messages = Message.all.where( uid: current_user.id )
  end
end