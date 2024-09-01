class UsersController < ApplicationController
  def new
      @user = User.new
  end
  
  def create
      @user = User.new(user_params)
      if @user.save
          redirect_to user_path(@user.id)
      else
          render :new, status: :unprocessable_entity
      end
  end
  
  def show
      @user = User.find(params[:id])
  end
  
  def edit
      @user = User.find(params[:id])
  end
  
  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
          flash[:danger] = 'Profileを編集しました'
          redirect_to user_path(@user.id)
      else
          render :edit, status: :unprocessable_entity
      end
  end
  
  
  private
  
  def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:avatar,:avatar_cache)
  end
end
