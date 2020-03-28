class PostsController < ApplicationController
    def new
      @post = Post.new
    end

    def index
      @post = Post.all
      @posts = Post.page(params[:page]).per(12).reverse_order
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

    def edit
    end

    def destroy
    end

    def update
    end

  private
    def post_params
      params.require(:post).permit(:user_id, :area_id, :image_id, :created_at, :title, :body, category_ids: [])
    end
end

