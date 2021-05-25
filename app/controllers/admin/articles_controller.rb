class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
end
