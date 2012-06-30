class UsersController < ApplicationController

  def start
    @user = User.new
  end

  def create
    @user = User.new(params[:user]) #this "params" is from html forms
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Tutoria!"
      redirect_to user_path(@user)
    else
      render "start"
    end
  end

  def show
    @user = User.find(params[:id]) #this "params" is for querying
  end

end
