class Api::V1::FavoritePostsController < ApplicationController
  before_action :set_favorite_post, only: [:show, :update]
  before_action :authenticate_and_set_user

  # POST /favorite_posts
  def create
    @post = FavoritePost.new(post_params)
    @post.user_id = @current_user.id

    if @post.save
      render json: @post, status: :created, location: api_v1_post_url(@post)
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorite_posts/1
  def destroy
    @post = FavoritePost.find_by(user_id: @current_user.id, post_id: params[:id])
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_post
      @post = FavoritePost.find_by(user_id: @current_user.id, post_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:favorite_post).permit(:post_id)
    end
end
