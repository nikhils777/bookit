class WelcomeController < ApplicationController
  def index
    if current_user.role == "business"
      redirect_to products_path
    end 
    if current_user.role == "client"
      redirect_to clients_path
    end
        
  end
end
