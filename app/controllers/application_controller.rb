class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :search

  def search
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def after_sign_in_path_for(resource)
    posts_path
  end



end
