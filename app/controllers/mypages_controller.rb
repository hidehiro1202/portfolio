class MypagesController < ApplicationController
  def index
   @favorite_spots = current_user.favorite_spots
  end    
  
  def show
    @mypage = Mypage.find(params[:id])
    @favorite_spots = current_user.favorite_spots
  end
  
  def edit
    @mypage = Mypage.find(params[:id])
  end

  def update
   @mypage = Mypage.find(params[:id])
    if @mypage.update(mypage_params)
       redirect_to mypage_path, success:"ユーザー設定が完了"
    else
       flash.now[:danger] = "登録失敗"
       render :edit
    end
  end

  
  private
  def mypage_params
    params.require(:mypage).permit(:image, :description)
  end
end
