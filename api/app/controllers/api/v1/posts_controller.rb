class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_and_set_user

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts.as_json(:include => [:user,:type], :except => [:user_id,:type_id])
  end

  # GET /posts/1
  def show
    render json: @post.as_json(:include => [:user,:type])
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    @post.date = Time.current

    if @post.save
      render json: @post, status: :created, location: api_v1_post_url(@post)
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :description, :date, :timeToRead, :mainImage, :score, :content, :type_id)
    end
end
