class Api::V1::BookmarkPostsController < ApplicationController
  before_action :set_bookmark_post, only: [:show, :update]
  before_action :authenticate_and_set_user

  # POST /bookmark_posts
  def create
    @post = BookmarkPost.new(post_params)
    @post.user_id = @current_user.id

    if @post.save
      render json: @post, status: :created, location: api_v1_post_url(@post)
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookmark_posts/1
  def destroy
    @post = BookmarkPost.find_by(user_id: @current_user.id, post_id: params[:id])
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark_post
      @post = BookmarkPost.find_by(user_id: @current_user.id, post_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:bookmark_post).permit(:post_id)
    end
end
