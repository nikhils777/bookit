class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role == "client"
      redirect_to root_path, notice: "Your account is not authorized for that section of the website!"
    end
    @product = Product.new
    @products = Product.all.where(user_id: current_user.id)
    @bookings = Booking.all.where(uid: current_user.id, confirmed: false)
    @confbookings = Booking.all.where(uid: current_user.id, confirmed: true)
    @message = Message.new
    @allbookings = Booking.all.where(uid: current_user.id)
    
    @messages = Message.all.where( uid: current_user.id )
    # Get pundit working and look at pundit scoping for index since
    # you can't do authorize checking on index
  end
  def create
    @product = current_user.products.build( product_params )
    authorize @product
    if @product.save
      redirect_to products_path, notice: "Product created!"
    else
      redirect_to products_path, notice: "Errors in Product form => #{@product.errors.full_messages.flatten}"
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  def destroy
    @product = Product.find(params[:id])
    authorize @product
    if @product.destroy
      redirect_to root_path, notice: "Product removed!"
    else
      redirect_to root_path, notice: "Error removing product!"
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :description, :length, :price)
  end
end
