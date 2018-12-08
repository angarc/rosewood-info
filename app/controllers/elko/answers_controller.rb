class Elko::AnswersController < Elko::BlocksController
  before_action :authenticate_elko_user!

  def block_model
    Answer
  end

end