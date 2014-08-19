class UsertypeController < ApplicationController
  def update
    User.find(current_user.id).update_attributes(role: params[:role])
    if User.find(current_user.id).role == params[:role]
      redirect_to root_path, notice: "Role Saved!"
    else
      redirect_to root_path, notice: "Role not saved try again!"
    end
  end
end
