
class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show, :index, :update, :destroy]
  before_action :user_is_author, only: [:edit, :update, :destroy]

  def index
    @gossips = Gossip.all
    @users = User.all
    @tags = Tag.all
    @taggables = Taggable.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.find(params[:user_id])
    @city = City.find(@user.city_id)
    # @comments = Comment.select { |comment| comment.gossip_id==params[:id]}
    @comments = Comment.all
    @comments_by_gossip_id = @comments.where(gossip_id: params[:id]).ids
    @tags = Tag.all
  end

   # Méthode qui permet de créer un nouveau gossip
   def new
    @gossip = Gossip.new
    @tags = Tag.all
    @tags_title = @tags.map { |tag| tag.title}
  end

  # Méthode qui permet de créer un nouveau gossip avec les params récupéré dans le formulaire de la vue new de gossip
  def create
    @gossip = Gossip.new(gossip_params.merge(user_id: current_user.id))
    if @gossip.save
    
    redirect_to root_path
    else
    render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @tags = Tag.all
    @tags_title = @tags.map { |tag| tag.title}
    @tags_check = @gossip.tags
  end

  def update
    @gossip = Gossip.find(params[:id])
     if @gossip.update(gossip_params) 

      redirect_to root_path
    else
      render :edit
    end
  end

  # Méthode qui permet de supprimer le gossip 
  def destroy
    @gossip = Gossip.find(params[:id])
    
    @gossip.destroy
    
    redirect_to root_path

  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :tag_ids => [])
    # params.permit(:title, :content, :tag_ids => [])
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def user_is_author
    unless current_user == Gossip.find(params[:id]).user
      flash[:not_author] = "Tu n'es pas l'auteur du potin"
      redirect_to root_path
    end
  end

end