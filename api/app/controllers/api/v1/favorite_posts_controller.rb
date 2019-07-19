class Api::V1::FavoritePostsController < ApplicationController
  before_action :set_favorite_post, only: [:show, :update]
  before_action :authenticate_and_set_user

  # POST /favorite_posts
  def create
    @favoritepost = FavoritePost.new(post_params)
    @favoritepost.user_id = @current_user.id

    if @favoritepost.save
      @post = Post.find(@favoritepost.post_id)
      @post.increment(:score, 1)
      if @post.save
        render json: @favoritepost, status: :created, location: api_v1_favorite_post_url(@favoritepost)
      else
        render json: @favoritepost.errors, status: :unprocessable_entity
      end
    else
      render json: @favoritepost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorite_posts/1
  def destroy
    @favoritepost = FavoritePost.find_by(user_id: @current_user.id, post_id: params[:id])
    if @favoritepost.destroy
      @post = Post.find(@favoritepost.post_id)
      @post.decrement(:score, 1)
      @post.save
    end
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
