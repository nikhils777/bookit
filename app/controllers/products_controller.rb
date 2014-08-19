class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.new
    @products = Product.where(user_id: current_user.id)
    # Get pundit working and look at pundit scoping for index since
    # you can't do authorize checking on index
  end
  def create
    @product = current_user.products.build( product_params )
    if @product.save
      redirect_to products_path, notice: "Product was saved created!"
    else
      redirect_to products_path, notice: "Error saving product"
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :description, :length)
  end
end
