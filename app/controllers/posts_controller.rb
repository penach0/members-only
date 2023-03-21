class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id] if session[:user_id]

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def require_login
      unless session[:user_id]
        flash[:error] = "You must be logged in!"
        redirect_to new_session_path
      end
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
