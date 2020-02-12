class MypagesController < ApplicationController
  def index
  end
  
 def update
    @mypage = Mypage(params[:id])
   
   if current_user == @mypage
     
    if @mypage.update(mypage_params)
       flash[:success] = "登録完了"
       render :edit
    else
       flash.now[:danger] = "登録失敗"
       render :edit
    end
     
   else
     redirect_to root_path
   end
 end
  
  
  def new
    @mypage = Mypage.new
  end
  
  
  #def create
  # @mypage = current_user.mypages.new(mypage_params)
  # if @mypage.save
  #   redirect_to mypages_path, success:"ユーザー設定が完了しました"
  # else
 #    flash.now[:danger] = "ユーザー設定に失敗しました"
 #    render :new
 #  end
  #end

  
  private
  def mypage_params
    params.require(:mypage).permit(:image, :description)
  end
end
