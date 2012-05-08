class UsersController < ApplicationController
  
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      @games = Game.where("started = false and ended = false")
      redirect_to games_path
    else
      render :action => "new"
    end
  end
  
end
