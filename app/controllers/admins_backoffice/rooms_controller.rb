class AdminsBackoffice::RoomsController < AdminsBackofficeController
    before_action :set_room, only: %i[edit update destroy show]
    before_action :set_activity, only: %i[activity_edit activity_update activity_destroy]
  
    def index
      @rooms = Room.includes(:admin).page(params[:page]).per(3)
    end

    def new
        @room = Room.new
    end

    def show
        @activities = Activity.where(admin_id: current_admin.id).page(params[:page]).per(5)
    end

    def create
        @room = Room.new(params_room)
        if @room.save
            redirect_to admins_backoffice_rooms_path, notice: "Sala virtual cadastrada com sucesso!"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @room.update(params_room)
            redirect_to admins_backoffice_rooms_path, notice: "Sala virtual atualizada com sucesso!"
        else
            render :edit
        end
    end

    def destroy
        if @room.destroy
            redirect_to admins_backoffice_rooms_path, notice: "Sala virtual excluída com sucesso!"
        else
            render :index
        end
    end

    def activities_list
        @rooms = Room.all
    end
    
    def activity_edit
    end
  
    def activity_new
      @activity = Activity.new
    end

    private

    def activity_params
        params.require(:activity).permit(:activity_name, :image, :description, :start_time, :end_time,
                                         :points, :admin_id, :room_id, archives_attributes: [:id, :description, :attachment, :_destroy])
    end
    
    def set_activity
        @activity = Activity.find(params[:id])
    end

    def params_room
        params.require(:room).permit(:room_name, :description, :code, :password, :admin_id)
    end

    def set_room
        @room = Room.find(params[:id])
    end
end
