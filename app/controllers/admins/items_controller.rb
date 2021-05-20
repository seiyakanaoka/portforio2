class Admins::ItemsController < ApplicationController
  # before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(current_admin)
    else
      render :new
    end
  end

  def index
    @items = current_admin.items
  end

  private

  def item_params
    list = [
      :genre_id,
      :name,
      :item_image,
      :introduction,
      :price,
      :is_active,
    ]
    params.require(:item).permit(list)
  end
end
