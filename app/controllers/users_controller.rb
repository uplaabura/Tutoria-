class UsersController < ApplicationController
  def start
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #save succeed
    else
      render "start"
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
