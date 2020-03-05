class SpotsController < ApplicationController
  def index
    @spots = Spot.all.includes(:favorite_users)
  end
  
  def new
    @spot = Spot.new
  end
  
  def show
    @spot = Spot.find(params[:id])
  end
  
  def create
    @spot = Spot.new(user_params)
    if @spot.save
      redirect_to root_path, success: '登録に成功しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  private
  def user_params
   params.require(:spot).permit(:spot_name, :description, :image)
  end
  
end
