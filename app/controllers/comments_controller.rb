class CommentsController < ApplicationController
  def index
    @comment_users = Post.find(params[:post_id]).comment_users
  end

  def show;end

  def new
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(post_id: params[:post_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def edit
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
