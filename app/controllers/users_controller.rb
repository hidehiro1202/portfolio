class UsersController < ApplicationController
  def new
  @user = User.new
  @favorite_spots = current_user.favorite_spots
  end
  
  def show
    @user = User.find(params[:id])
  end  

  def create
    @user = User.new(user_params)
    if @user.save  
      redirect_to login_path, success: '登録に成功しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if current_user == @user
     if @user.update(user_params)
　　 　redirect_to user_path, success: 'ユーザーの編集に成功しました'
     else
       flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
       render :edit
     end   
   else
     redirect_to root_url
   end
  end

  
  private
  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :description)
  end
  
end
