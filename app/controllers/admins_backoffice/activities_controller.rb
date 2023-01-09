class AdminsBackoffice::ActivitiesController < AdminsBackofficeController
  before_action :set_activity, only: %i[edit update destroy]
  
  def index
    @activities = Activity.where(admin_id: current_admin.id).page(params[:page]).per(5)
  end

  def edit
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to admins_backoffice_room_path(@activity.room_id), notice: 'Atividade criada com sucesso!'
    else
      render :new
    end
  end

  def update
    if @activity.update(activity_params)
        redirect_to admins_backoffice_room_path(@activity.room_id), notice: "Atividade atualizada com sucesso!"
    else
        render :edit
    end
  end


  def destroy
    if @activity.destroy
        redirect_to admins_backoffice_room_path(@activity.room_id), notice: "Sala virtual excluída com sucesso!"
    else
        render :index
    end
  end
  
  private
  
  def activity_params
    params.require(:activity).permit(:activity_name, :description, :start_time, :end_time, :points, :admin_id,
                                     :room_id, archives_attributes: [:id, :description, :attachment, :_destroy])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
  
end
