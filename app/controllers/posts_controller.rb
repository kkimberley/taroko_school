class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def show
    page = MetaInspector.new(@post.url)
    url_split = page.title.split(/: /)[0].split(/- /)
    markdown = Redcarpet::Markdown.new(MdEmoji::Render, :no_intra_emphasis => true)

    @url_img = page.images.best
    @url_favicon = page.images.favicon
    @url_title = url_split[0]
    @url_subtitle = url_split[1]
    @url_description = markdown.render(page.description).html_safe
    @url_url = page.url
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

  private

  def post_params
    params.require(:post).permit(:title, :description, :url)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
