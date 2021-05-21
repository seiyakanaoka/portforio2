class Admins::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'
end
