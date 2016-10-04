class CoursesController < ApplicationController
  before_action :find_course, except: [:new, :create]

  def show
  end

  def new
    @course = @path.courses.build
  end

  def edit
  end

  def create
    @course = @path.courses.create(course_params)

    redirect_to path_path(@path)
  end

  def update
    if @course.update(course_params)
      redirect_to path_path(@path)
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy

    redirect_to path_path(@path)
  end

  private

  def course_params
    params.require(:course).permit(:title, :description)
  end

  def find_course
    @path = Path.find_by(title: params[:path_id])
    @course = Course.find_by(title: params[:id])

    if @course.nil?
      redirect_to path_path(@path)
    end
  end
end
