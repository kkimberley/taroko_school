class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = sort(Post.all)
  end

  def show
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
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to action: :index
  end

  def uplike
    @post.likes.create
    redirect_to(posts_path)
  end

  def downlike
    @post.likes.last.destroy
    redirect_to(posts_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :url)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def sort(posts)
    posts.sort_by{ |post| post.likes.count }.reverse
  end
end
