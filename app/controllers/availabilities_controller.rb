class AvailabilitiesController < ApplicationController
  def create
    @availability = current_user.availabilities.build( availability_params )
    authorize @availability
    if @availability.save
      redirect_to root_path, notice: "Availability added!"
    else
      redirect_to root_path, notice: "Error adding availability #{@availability.errors.full_messages}"
    end
  end
  def destroy
    @availability = Availability.find( params[:id])
    authorize @availability
    if @availability.destroy
      redirect_to root_path, notice: "Availability removed!"
    else
      redirect_to root_path, notice: "Error destroying availability!"
    end
  end

  private

  def availability_params
    params.require(:availability).permit(:date, :start, :end)
  end
end