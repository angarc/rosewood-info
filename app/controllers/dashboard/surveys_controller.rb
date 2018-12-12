class Dashboard::SurveysController < DashboardController

	def index
		@surveys = current_user.surveys
	end

	def new
		@survey = Survey.new
	end

	def create
		@survey = Survey.new survey_params
		current_user.surveys << @survey
		if @survey.save
			flash[:success] = "You successfully created a new Survey!"
			redirect_to dashboard_surveys_path
		else
			flash[:danger] = @survey.errors.full_messages.to_sentence
			redirect_to dashboard_surveys_path
		end
	end

	def show
		@survey = current_user.surveys.find(params[:id])
		@questions = @survey.questions
	end

	def destroy
		@survey = current_user.surveys.find(params[:id])

		if @survey.destroy
			flash[:success] = "We successfully deleted your survey!"
			redirect_back fallback_location: dashboard_surveys_path
		else
			flash[:danger] = @survey.errors.full_messages.to_sentence
			redirect_back fallback_location: dashboard_surveys_path
		end
	end

  def publish
		@survey = current_user.surveys.find(params[:id])
		@survey.toggle_status
		flash[:success] = 'Successfully published your survey!'
		redirect_back fallback_location: @survey
	end

	private 

	def survey_params
		params.require(:survey).permit(:title, :description, :access_code)
	end
end