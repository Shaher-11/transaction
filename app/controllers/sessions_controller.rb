class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      session[:author_id] = @user.id
      flash[:success] = 'Signed in Succefully!.'
      redirect_to root_path
    else
      flash.now[:danger] = 'Sign in Error.'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'Signed out successfully!'
  end
end
