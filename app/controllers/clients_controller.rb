class ClientsController < ApplicationController
  before_action :authenticate_user!
  def index
    @businesses = User.all.where( role: "business")
  end
end