class ProfilsController < ApplicationController
  def new
    @profil = Profil.new
  end
  
  def create
  @profil = current_user.profils.new(profil_params)
   if @profil.save
     redirect_to mypage_index_path, success:"ユーザー設定が完了しました"
   else
     flash.now[:danger] = "ユーザー設定に失敗しました"
   end
  end
  
  private
  def profil_params
    params.require(:profil).permit(:image, :description,)
  end
end
