class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = "Username not found"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
