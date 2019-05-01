class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    @users = User.all
  end

  def show
    @gossip = Gossip.find(params[:id])
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
