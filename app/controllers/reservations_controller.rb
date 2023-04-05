class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:new, :edit, :update, :destroy]


  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end
  
  def create
    puts "Params: #{params.inspect}"
    @room = Room.find(params[:reservation]["room_id"])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.room_id = @room.id
  
    if @reservation.save
      flash[:notice] = '予約が完了しました。'
      redirect_to reservation_path(@reservation)
    else
      flash[:alert] = '予約に失敗しました。'
      render :new
    end
  end
  
  

  def index
    @reservations = current_user.reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation), notice: "予約情報が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: "予約が削除されました"
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.room_id = @room.id
  end
  
  
  
  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :num_of_guests, :room_id)
  end
  
end