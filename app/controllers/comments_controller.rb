class CommentsController < ApplicationController
  before_action :set_post, only: %i[new edit create update destroy]
  before_action :set_comment, only: %i[edit update destroy]

  def index
    @comment_users = Post.find(params[:post_id]).comment_users.distinct
  end

  def show;end

  def new
    @comment = current_user.comments.build(post_id: params[:post_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post

    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit;end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: "「#{@comment.user.name} #{@comment.created_at.strftime('%Y-%m-%d %H:%M')}」のコメントを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post), notice: "「#{@comment.user.name} #{@comment.created_at.strftime('%Y-%m-%d %H:%M')}」のコメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
