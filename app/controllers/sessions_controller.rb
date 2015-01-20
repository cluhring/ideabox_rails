class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:sesh][:username])
    if user && user.authenticate(params[:sesh][:password])
      # require 'pry' ; binding.pry
      session[:user_id] = user.id
      flash[:notice] = "Successful login."
      redirect_to user_path(user.id) #the argument of the user object   becomes the :id of the params in the usercontroller.
    else
      flash[:errors] = "You typed in the wrong username/password"
      render :new
    end
  end

  def destroy
    flash[:errors] = "Successful logout"
    session.clear
    redirect_to root_path
  end

end
