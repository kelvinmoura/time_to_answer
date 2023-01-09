class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @questions = Question.includes(:subject)
                          .order(:description)
                          .page(params[:page])
  end
end
