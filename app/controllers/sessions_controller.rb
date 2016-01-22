class SessionsController < ApplicationController
  include CurrentCart
  skip_before_action :authorize, only: [:new, :create]
  before_action :set_cart
  
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to store_path
  	else
  		render "new", alert: "Invalid user/password combination"
    end
  end

  def destroy
    #@cart.unlock_quantity(@cart)
  	session[:user_id] = nil
  	redirect_to store_url, notice: "Logged out"
  end
end
