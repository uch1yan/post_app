class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post= Post.new(post_params)
    if params[:back]
      render :new
    elsif  @post.save
      redirect_to posts_path, notice: 'コメントを投稿しました！'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update
      redirect_to posts_path, notice: '投稿を更新しました！'
    else
      render :edit
    end
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path, notice: '投稿を削除しました！'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
