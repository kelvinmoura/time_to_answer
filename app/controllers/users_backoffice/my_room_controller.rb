class UsersBackoffice::MyRoomController < UsersBackofficeController
  before_action :set_my_room, only: %i[destroy]

  def index
    @my_rooms = Room.joins(:room_users).where(room_users: { user_id: current_user.id }).page(params[:page]).per(5)
  end

  def destroy
    if @room_user.destroy
        redirect_to admins_backoffice_rooms_path, notice: "Desconectado com sucesso!"
    else
        render :index
    end
  end

  private

  def set_my_room
    @room_user = RoomUser.find(params[:id])
  end
  
end
