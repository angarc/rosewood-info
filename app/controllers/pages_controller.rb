class PagesController < ApplicationController

	def home
		@survey_query = SurveyQuery.new
		@features = Feature.published
	end

end