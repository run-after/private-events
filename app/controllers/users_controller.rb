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
    @created_events = Event.where(creator_id: current_user.id)
    @prev_events = current_user.prev_events
    @upcoming_events = current_user.upcoming_events
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end

    def current_user
      User.find(params[:id])
    end
end
