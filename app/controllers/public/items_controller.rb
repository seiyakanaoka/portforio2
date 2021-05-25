class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  layout 'public'

  def show
    @item = Item.find(params[:id])
  end

end
