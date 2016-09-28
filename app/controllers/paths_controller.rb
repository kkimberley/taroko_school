class PathsController < ApplicationController
  before_action :authenticate_user!

  def index
    @paths = Path.all
  end

  def show
    @path = Path.find_by_url(params[:id])
  end

  def new
    @path = Path.new
  end

  def edit
    @path = Path.find_by_url(params[:id])
  end

  def create
    @path = Path.new(path_params)

    @path.save
    redirect_to action: :index
  end

  def update
    @path = Path.find(params[:id])

    if @path.update(path_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    @path = Path.find(params[:id])
    @path.destroy

    redirect_to paths_path
  end

  private

  def path_params
    params.require(:path).permit(:title, :description)
  end
end
