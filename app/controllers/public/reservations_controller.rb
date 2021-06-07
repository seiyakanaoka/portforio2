class Public::ReservationsController < ApplicationController
  before_action :authenticate_customer!
  layout 'public'

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    @reservation.save
    redirect_to reservations_clear_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
    @reservation = current_customer.reservations
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @admin = @reservation.admin
    @item = @admin.items
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to customer_path(current_customer)
    else
      render :edit
    end
  end

  def back
		@reservation = Reservation.new(reservation_params)
		redirect_to admin_path(@reservation.admin_id)
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
  end

  def clear
  end

  private

  def reservation_params
    params.require(:reservation).permit(:admin_id, :people, :time, :date, :request, :item_id, :seat)
  end
end
