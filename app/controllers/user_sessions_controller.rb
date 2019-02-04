class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :index, :create]
  def new
    @user = User.new
  end

  def create
    puts params
    # @user = login(params[:email], params[:password])
    @user = login(params[:username], params[:password], params[:remember])
    puts "@user" , @user&.errors
    if @user
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end