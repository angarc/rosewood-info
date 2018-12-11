class Elko::AuthorizedSurveyeesListsController < Elko::BlocksController
  before_action :authenticate_elko_user!

  def block_model
    AuthorizedSurveyeesList
  end

end