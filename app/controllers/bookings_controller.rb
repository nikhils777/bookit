class BookingsController < ApplicationController
  def new
    @user = User.find( params[:buser] )
    @products = Product.all.where(user_id: @user.id)
    @confbookings = Booking.all.where(uid: @user.id, confirmed: true)
    @bookings = Booking.all.where(uid: @user.id, confirmed: false)
  end
  def create
    @booking = current_user.bookings.build( booking_params )
    @booking.name = (Product.find( @booking.product_id ).name.to_s) + " on #{@booking.date} from #{@booking.start} to #{@booking.end} with " + (User.find( @booking.uid ).name.to_s) + " for " + (User.find( @booking.user_id ).name.to_s)
     
    authorize @booking
    if @booking.save
      redirect_to root_path, notice: "Your Booking was saved!"
    else
      redirect_to root_path, notice: "Errors in creating booking => #{@booking.errors.full_messages}"
    end
  end

  def update
    @booking = Booking.find( params[:id])
    @booking.confirmed = true
    authorize @booking
    if @booking.save
      redirect_to root_path , notice: "Booking confirmed!"
    else
      redirect_to root_path , notice: "Error confirming booking"
    end
  end

  def destroy
    @booking = Booking.find( params[:id])
    authorize @booking
    if @booking.destroy
      redirect_to root_path , notice: "Booking deleted!"
    else
      redirect_to root_path , notice: "Error deleting Booking"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end, :product_id, :uid, :date)
  end
end