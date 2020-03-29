class PostsController < ApplicationController
    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
        redirect_to root_path, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def index
      @post = Post.all.reverse_order
      @posts = Post.page(params[:page]).per(12)
    end

    def show
      @post = Post.find(params[:id])
      @comment = Comment.new
    end

    def edit
    end

    def destroy
    end

    def update
    end

  private
    def post_params
      params.require(:post).permit(:user_id, :image, :created_at, :title, :body, category_ids: [])
    end
end

