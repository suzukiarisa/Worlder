class PostsController < ApplicationController
    def new
    end

    def index
      @post = Post.all
      @posts = Post.page(params[:page]).per(12).reverse_order
    end

    def create
    end

    def edit
    end

    def destroy
    end

    def update
    end

  private
    def post_params
      params.require(:post).permit(:image_id, :nickname, :created_at, :title, :body)
    end
end

