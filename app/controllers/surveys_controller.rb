class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id]);

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

  private

  def survey_query_params
    params.require(:survey_query).permit(:query)
  end

end