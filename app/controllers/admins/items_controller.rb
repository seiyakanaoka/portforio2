class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: [:show, :edit, :update]
  layout 'admins'

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    @item.admin_id = current_admin.id
    if @item.save
      redirect_to admins_items_path
    else
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to admins_item_path(@item)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:genre_id, :name, :item_image, :introduction, :price, :is_active)
  end
end
