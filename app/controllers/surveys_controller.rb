class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id])

    if @survey.authorized?
      if (!params[:identification].present?) || (!@survey.authorized_surveyees_list.includes?(params[:identification]))
        redirect_to authorize_survey_path(@survey)
        return
      end
    end

    if params[:processable].present? && params[:processable] == "true"
      params.keys.each do |key|
        @question = @survey.questions.find_by_title(key)
        if @question
          @answer = @question.answers.find_by_title(params[key])
          if @answer
            @answer.number_of_times_chosen = @answer.number_of_times_chosen + 1
            @answer.save
          end
        end
      end

      if @survey.authorized?
        @new_array_list = @survey.authorized_surveyees_list.list.split(" ").delete_if { |a| a == params[:identification]}
        @survey.authorized_surveyees_list.list = @new_array_list.join(" ")
        @survey.authorized_surveyees_list.save
      end

      redirect_to root_path
    end
  end

  def search
    @search_query = SurveyQuery.new survey_query_params

    @survey = Survey.published.find_by_access_code(@search_query.query)
    if @survey
      redirect_to @survey
    else
      flash[:danger] = 'Whoops! We couldn\'t find a survey with that access code! :('
      redirect_back fallback_location: root_path
    end
  end

  def authorize
    @survey = Survey.find(params[:id])
    @authorized_entry = AuthorizedEntry.new
  end

  def process_authorization
    @survey = Survey.find(params[:id])
    @authorized_entry = AuthorizedEntry.new authorized_entry_params

    if @survey.authorized_surveyees_list.includes?(@authorized_entry.identification)
      redirect_to survey_path(@survey, identification: @authorized_entry.identification)
    else
      redirect_to root_path
    end
  end

  private
  def authorized_entry_params
    params.require(:authorized_entry).permit(:identification)
  end

  def survey_query_params
    params.require(:survey_query).permit(:query)
  end

end