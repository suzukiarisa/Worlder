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
      if params[:q] == nil #読み込み時処理
        @q = Post.includes(:comments).ransack(params[:q])
        @posts = @q.result(distinct: true).page(params[:page])
      else #検索時の処理
        params[:q][:title_or_body_or_comments_body_cont_any] = params[:q][:title_or_body_or_comments_body_cont_any]
        #ransack検索
        @q = Post.includes(:comments).ransack(params[:q])
        @posts = @q.result(distinct: true).page(params[:page])
        params[:q][:title_or_body_or_comments_body_cont_any] = params[:q][:title_or_body_or_comments_body_cont_any]
      end
    end

    def show
      @post = Post.find(params[:id])
      @comment = Comment.new
    end

    def edit
        @post = Post.find(params[:id])
        @user = @post.user
      if current_user != @user
        redirect_to posts_path
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = "Post deleted."
      redirect_to mypage_path(@post.user)
    end

    def update
        @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:notice] = "Post was successfully updated."
        redirect_to mypage_path(@post.user)
      else
        render :edit
      end
    end

  private
    def post_params
      params.require(:post).permit(:user_id, :image, :created_at, :title, :body, category_ids: [])
    end
end

