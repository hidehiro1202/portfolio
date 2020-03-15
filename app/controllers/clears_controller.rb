class ClearsController < ApplicationController
  def index
  @clear_spots = current_user.clear_spots
  end

  
  def create
    clear = Clear.new
    clear.user_id = current_user.id
    clear.spot_id = params[:spot_id]
    
  
  if clear.save
    redirect_to spots_path, success: '達成済みに登録しました'
  else
    redirect_to spots_path, danger: '達成済みの登録に失敗しました'
  end

  
  end
  
  def destroy
    clear = current_user.clears.find_by(spot_id: params[:spot_id])
    
    if clear.destroy
    redirect_to spots_path,success: '達成済みを解除しました'
    end
  end 
end
