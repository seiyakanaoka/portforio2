class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  layout 'public'

end
