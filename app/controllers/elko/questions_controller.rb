class Elko::QuestionsController < Elko::BlocksController
  before_action :authenticate_elko_user!

  def block_model
    Question
  end

end