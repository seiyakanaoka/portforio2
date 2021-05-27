class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @reservations = current_admin.reservations
    @admin = current_admin
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_back(fallback_location: root_path)
  end

  def withdraw
    @reservation = Reservation.find(params[:id])
    if @reservation.is_active == false
      @reservation.update(is_active: true)
      redirect_back(fallback_location: root_path)
    else
      @reservation.update(is_active: false)
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:seat)
  end
end
