class PostsController < ApplicationController
  include SessionsHelper
  before_action :ensure_user, only: %i[ edit update destroy ]

  def index
    @posts = Post.all
  end


  def show
    @post = Post.find(params[:id])
  end
  


  def new
    @post = Post.new
  end


  def edit
  end


  def create
    @post = current_user.posts.build(post_params)
    return render :new if params[:back]
    if @post.save
      PostCompleteMailer.post_complete(@post.user).deliver
      redirect_to posts_path, notice: '投稿しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    render :new if @post.invalid?
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '更新しました。'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: '投稿を削除しました。'
  end

  private
  
  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id, {image: []}, :image_cache)
  end

end
