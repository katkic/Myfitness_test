class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: '投稿を保存しました'
    else
      render :new
    end
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
