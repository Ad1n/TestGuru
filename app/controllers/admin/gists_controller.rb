class Admin::GistsController < Admin::BaseController

  def index
    @gists = Gist.all
  end

  def show

  end

end
