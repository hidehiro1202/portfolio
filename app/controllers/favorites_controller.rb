class FavoritesController < ApplicationController
  def index
  @favorite_spots = current_user.favorite_spots
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.spot_id = params[:spot_id]
    
  
  if favorite.save
    redirect_to spots_path, success: 'お気に入りに登録しました'
  else
    redirect_to spots_path, danger: 'お気に入りに登録に失敗しました'
  end

  
  end
  
  def destroy
    favorite = current_user.favorites.find_by(spot_id: params[:spot_id])
    
    if favorite.destroy
    redirect_to spots_path,success: 'お気に入りを解除しました'
    end
  end 
end
