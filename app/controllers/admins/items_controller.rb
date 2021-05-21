class Admins::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update]

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_items_path
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to adimns_item_path(@item)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

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
