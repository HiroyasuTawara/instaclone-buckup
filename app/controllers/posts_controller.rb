class PostsController < ApplicationController
  include SessionsHelper
  before_action :ensure_user, only: %i[ edit update destroy ]
  skip_before_action :login_required, only:[:index, :show]
  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)
    return render :new if params[:back]
    if @post.save
      redirect_to post_url(@post), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_post.id 
    render :new if @post.invalid?
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
  
  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id, { image: [] }, :image_cache)
  end

end
