class UsersController < ApplicationController
  before_action :maching_user, only: [:edit,:update]
  
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
  def maching_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
end
