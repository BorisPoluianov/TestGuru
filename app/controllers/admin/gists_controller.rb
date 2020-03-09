class GistsController < Admin::BaseController
  def index
    @gist = Gist.all
  end
end
