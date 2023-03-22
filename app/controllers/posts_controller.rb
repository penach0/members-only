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
    @post.user_id = current_user.id if logged_in?

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in!"
        redirect_to new_session_path
      end
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
