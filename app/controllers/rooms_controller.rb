class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  
  def index
    if user_signed_in?
      @rooms = current_user.rooms
    else
      @rooms = Room.all
    end
    
    if params[:area].present?
      @rooms = @rooms.where(area: params[:area])
    end
    if params[:keyword].present?
      @rooms = @rooms.where("name LIKE ? OR address LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end
  end
  
  
    
      def show
        @room = Room.find(params[:id])
      end
    
      def new
        @room = Room.new
      end
    
      def create
        @room = current_user.rooms.new(room_params)
        if @room.save
          redirect_to rooms_path, notice: "施設が登録されました。"
        else
          render :new
        end
      end
    
      def search
        @rooms = Room.all
      
        if params[:area].present?
          @rooms = @rooms.where("address LIKE ?", "%#{params[:area]}%")
        end
        if params[:keyword].present?
          @rooms = @rooms.where("name LIKE ? OR description LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
        end
      end
    
      def edit
        @room = Room.find(params[:id])
      end
      
      def update
        @room = Room.find(params[:id])
      
        if @room.update(room_params)
          redirect_to room_path(@room), notice: "施設情報が更新されました"
        else
          render :edit
        end
      end

      private
    
      def room_params
        params.require(:room).permit(:name, :description, :price, :address, :image)
      end
end
