class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if !@user.nil? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end

  end



end
