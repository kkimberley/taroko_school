class MissionsController < ApplicationController
  before_action :find_path, :find_course
  before_action :find_mission, except: [:new]

  def show
  end

  def new
    @mission = @course.missions.build
  end

  def edit
  end

  def update
    if @mission.update(mission_params)
      head :no_content
    else
      render 'edit'
    end
  end

  def create
    @mission = @course.missions.create(mission_params)

    redirect_to path_course_path(@path, @course)
  end

  def destroy
    @mission.destroy

    redirect_to path_course_path(@path, @course)
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :url, :if_finish)
  end

  def find_path
    @path = Path.find_by(title: params[:path_id])
  end

  def find_course
    @course = @path.courses.find_by(title: params[:course_id])
  end

  def find_mission
    @mission = @course.missions.find_by(title: params[:id])

    redirect_to path_course_path(@path, @course) unless @course
  end
end
