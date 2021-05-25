class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
  before_action :set_admin, only: [:show, :my_page]

  def show
    @item = @admin.items
  end

  def my_page
    @item = @admin.items
    @genre = @admin.genres
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.update(admin_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def admin_params
    params.require(:admin).permit(:seat)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
