class Elko::SurveysController < Elko::BlocksController
  before_action :authenticate_elko_user!

  def block_model
    Survey
  end

end