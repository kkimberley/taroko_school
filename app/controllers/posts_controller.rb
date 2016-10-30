class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.unsort
  end

  def show
    page = MetaInspector.new(@post.url)
    @knowledge = WebScrape.new(page)

    render locals: {
      knowledge:  @knowledge
    }
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to action: :index
  end

  def update
    if @post.update(post_params)
      redirect_rule
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_rule
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :url, :course_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def find_path_course
    @course = Course.find(@post.course_id)
    @path = Path.find(@course.path_id)
  end

  def redirect_rule
    if @post.course_id?
      find_path_course
      redirect_to path_course_path(@path, @course)
    else
      redirect_to action: :index
    end
  end
end
