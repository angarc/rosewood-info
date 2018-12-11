class Elko::FeaturesController < Elko::BlocksController
  before_action :authenticate_elko_user!

  def block_model
    Feature
  end

end