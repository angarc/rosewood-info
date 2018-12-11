class Dashboard::QuestionsController < DashboardController

  def new
    @survey = current_user.surveys.find(params[:survey_id])
    @question = Question.new
    @question.answers.build
  end

  def create
    @survey = current_user.surveys.find(params[:survey_id])
    @question = Question.new question_params

    if @question.save 
      @survey.questions << @question
      flash[:success] = "Successfully added question"
      redirect_to dashboard_survey_path @survey
    else
      flash[:danger] = @question.errors.full_messages.to_sentence
      render :edit
    end
  end

  def edit
    @survey = current_user.surveys.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @question.answers.build
  end

  def update
    @survey = current_user.surveys.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])

    if @question.update question_params 
      flash[:success] = 'Successfully updated question'
      redirect_to dashboard_survey_path @survey
    else
      flash[:error] = @question.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @question = current_user.surveys.find(params[:survey_id]).questions.find(params[:id])

    if @question.destroy
      flash[:success] = 'Successfully deleted question'
      redirect_back fallback_location: dashboard_surveys_path
    else
      flash[:danger] = @question.errors.full_messages.to_sentence
      redirect_back fallback_location: dashboard_surveys_path   
    end
  end

  private 

  def question_params
    params.require(:question).permit(:title, answers_attributes: Answer.attribute_names.map(&:to_sym).push(:_destroy))
  end

end