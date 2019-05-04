class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @city = City.find(@user.city_id)
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.create!(first_name: , last_name: , description: , email: , age: , city_id: )
    if @gossip.save
      
    redirect_to root_path
    else
    render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
