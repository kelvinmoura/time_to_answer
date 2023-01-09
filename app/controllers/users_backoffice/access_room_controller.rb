class UsersBackoffice::AccessRoomController < UsersBackofficeController
    before_action :set_room, only: %i[room_verify access]
    def index
        @rooms = Room.includes(:admin).page(params[:page]).per(3)
    end
    
    def access
    end
    def room_verify
        if @room.code == params[:code]
            RoomUser.create!(user_id: current_user.id, room_id: @room.id)
            redirect_to users_backoffice_access_room_index_path, notice:"Bem vindo #{current_user.email}"
        else
            render :access, notice:'Código invalido, consulte seu professor'
        end
    end
    
    

    private

    def params_room_user
        params.require(:room_user).permit(:room_id, :user_id)
    end

    def params_room
        params.require(:room).permit(:code)
    end

    def set_room
        @room = Room.find(params[:id])
    end
end
