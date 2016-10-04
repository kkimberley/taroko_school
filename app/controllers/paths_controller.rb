class PathsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_path

  def index
    @paths = Path.all
  end

  def show
    @courses = @path.courses
  end

  def new
    @path = Path.new
  end

  def edit
  end

  def create
    @path = Path.new(path_params)

    @path.save
    redirect_to action: :index
  end

  def update
    if @path.update(path_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    @path.destroy

    redirect_to paths_path
  end

  private

  def path_params
    params.require(:path).permit(:title, :description)
  end

  def find_path
    begin
      @path = Path.find_by(title: params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to action: :index
    end
  end
end
