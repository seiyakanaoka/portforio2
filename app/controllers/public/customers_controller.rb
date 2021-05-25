class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  layout 'public'

  def show
    @reservation = Reservation.where(customer_id: current_customer)
  end

  def edit

  end

end
