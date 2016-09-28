class PathsController < ApplicationController
  def index
    @paths = Path.all
  end

  def new
  end

  def create
    @path = Path.new(path_params)

    @path.save
    redirect_to action: :index
  end

  private

  def path_params
    params.require(:path).permit(:title, :url)
  end
end
