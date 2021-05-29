class Public::AdminsController < ApplicationController
  before_action :authenticate_customer!
  layout 'public'

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
    @item = @admin.items
    @articles = @admin.articles
    @reservation = Reservation.new
    @reservations = @admin.reservations
  end

end
