class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_request, only: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    # @posts = Post.all
    # render json: @posts, status: :ok
    #render json: @posts, status: :ok, serializer: Posts::IndexSerializer

    @posts = Post.order(published_at: :desc).page(params[:page] || 1).per(params[:per_page] || 3)

    response.headers["total_count"] = @posts.total_count.to_s
    response.headers["total_pages"] = @posts.total_pages.to_s

     render json: @posts, status: :ok, each_serializer: Posts::ShowSerializer
  end

  def show
    #render json: params, status: :unprocessable_entity
    render json: @post, status: :ok, serializer: Posts::ShowSerializer
  end

  def create

    #render json: 'test', status: :ok
    #render json: params, status: :unprocessable_entity
    #render plain: post_params.inspect


    @post = Post.new(post_params)
     if @post.save
       #render json: @post, status: :created
       render json: @post, status: :created, serializer: Posts::ShowSerializer
     else
       render json: {"errors":@post.errors}, status: :unprocessable_entity
     end
  end

  private

  def post_params
    #params[:published_at] = Time.now.to_s :db  if !params.key?(:published_at) || params[:published_at].blank?
    params[:user_id] = @current_user.id
    params.permit(:title, :body, :published_at, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end