class PagesController < ApplicationController

	def home
		@survey_query = SurveyQuery.new
	end

end