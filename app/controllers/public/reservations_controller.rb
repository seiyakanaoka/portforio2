class Public::ReservationsController < ApplicationController
  before_action :authenticate_customer!
  layout 'public'

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    @reservation.save
    redirect_to admins_path
  end

  def show
    @reservation = current_customer.reservations
  end

  def back
		@reservation = Reservation.new(reservation_params)
		redirect_to admin_path(@reservation.admin_id)
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:admin_id, :people, :time, :date, :request, :item_id)
  end
end
