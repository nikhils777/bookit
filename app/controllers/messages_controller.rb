class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build( message_params )
    @booking = Booking.find( @message.booking_id )
    @message.bstart = @booking.start
    @message.b_end = @booking.end
    @message.bdate = @booking.date
    @message.product_id = @booking.product_id
    @message.name = @booking.name
    @message.ctime = Time.now.strftime("%d/%m/%Y %H:%M")
    if @message.user_id == @booking.uid      # @booking.uid is always a provider(business owner) and @booking.user_id is always a client
      @message.uid = @booking.user_id       # @message.uid is who the message will be sent too
    else
      @message.uid = @booking.uid
    end
    authorize @message
    if @message.save && @booking.destroy
      redirect_to root_path, notice: "Booking has been destroyed!"
    else
      redirect_to root_path, notice: "Errors creating message => #{@message.errors.full_messages}"
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    authorize @message
    if @message.destroy
      redirect_to root_path , notice: "Message deleted!"
    else
      redirect_to root_path , notice: "Error deleting message!"
    end
  end

  private

  def message_params
    params.require(:message).permit(:booking_id , :info)
  end
end
