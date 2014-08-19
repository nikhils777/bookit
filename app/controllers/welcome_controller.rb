class WelcomeController < ApplicationController
  def index
    if current_user.role == "business"
      redirect_to products_path
    elsif current_user.role == "client"
      redirect_to clients_path
    else
      redirect_to root_path
    end
        
  end
end
