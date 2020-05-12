class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @events = Event.where(creator_id: session[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
