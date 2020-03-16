class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy,:show]
  def index
    @posts = Post.all.order("id DESC")
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).all.order("id DESC")
  end

  def edit
      @post = Post.find(params[:id])
  end


  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end



  def update
          @post = Post.find(params[:id])
          # モデルの更新は、クラスメソッドのupdateメソッドで行える
          @post.update(post_params)

          # リダイレクト処理
          redirect_to posts_path
      end

  def destroy
    @post = Post.find(params[:id])
    @post.delete

          # 投稿一覧へリダイレクト
          redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit( :name, :school, :genre, :people, :hi, :activeday, :details, :img, :remove_img)
  end
end
