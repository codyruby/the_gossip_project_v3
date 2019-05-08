class SessionsController < ApplicationController

  def new
    user = User.new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:session][:email].downcase)
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to :root
  end
end
