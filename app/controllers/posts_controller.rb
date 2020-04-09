class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
  end

  def new
  end

  def edit
  end
end
