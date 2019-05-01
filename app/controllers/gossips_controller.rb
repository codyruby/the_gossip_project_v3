class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    @users = User.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.find(params[:user_id])
    @city = City.find(@user.city_id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
