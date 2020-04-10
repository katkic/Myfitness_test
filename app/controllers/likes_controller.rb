class LikesController < ApplicationController
  def index
    @like_users = Post.find(params[:id]).like_users
  end
end
