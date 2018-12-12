class Dashboard::AuthorizedSurveyeesListsController < DashboardController

  def index

  end

  def new
    @survey = Survey.find(params[:survey_id])
    @authorized_surveyee_list = AuthorizedSurveyeesList.new
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @authorized_surveyee_list = AuthorizedSurveyeesList.new authorized_surveyees_list_params

    if @authorized_surveyee_list.save
      @survey.authorized_surveyees_list = @authorized_surveyee_list
      @survey.save
      flash[:success] = 'Successfully added the authorized surveyee list to your survey'
      redirect_to dashboard_survey_path @survey
    else
      flash[:danger] = @authorized_surveyee_list.errors.full_messages.to_sentence
      render "new"
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    @authorized_surveyee_list = @survey.authorized_surveyees_list
  end

  def update
    @survey = Survey.find(params[:id])
    @authorized_surveyee_list = @survey.authorized_surveyees_list

    if @authorized_surveyee_list.update authorized_surveyees_list_params
      flash[:success] = "Successfully updated this authorized surveyees list"
      redirect_to dashboard_survey_path @survey
    else
      flash[:danger] = @authorized_surveyee_list.errors.full_messages.to_sentence
      render "edit"
    end
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @surveyee_list = @survey.authorized_surveyees_list
  end

  def destroy
    @survey = Survey.find(params[:survey_id])
    @authorized_surveyee_list = @survey.authorized_surveyees_list

    if @authorized_surveyee_list.destroy
      flash[:success] = "Successfully deleted the authorized surveyees list"
      redirect_to dashboard_survey_path @survey
    else
      flash[:danger] = @authorized_surveyee_list.errors.full_messages.to_sentence
      redirect_to dashboard_survey_path @survey
    end
  end

  private
  def authorized_surveyees_list_params
    params.require(:authorized_surveyees_list).permit(:identification_type, :list)
  end

end