class Dashboard::AnswersController < ApplicationController

  def destroy
    @survey = current_user.surveys.find(params[:survey_id])
    @answer = @survey.questions.find(params[:question_id]).answers.find(params[:id])

    if @answer.destroy
      redirect_back fallback_location: @survey
    else
      flash[:danger] = @answer.errors.full_messages.to_sentence
      redirect_back fallback_location: @survey
    end
  end

end