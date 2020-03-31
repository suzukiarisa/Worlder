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
      @q = Post.ransack(params[:q])
      @q.build_condition if @q.conditions.empty?
      @posts = @q.result(distinct: true).page(params[:page]).per(20)
      @search = Post.ransack(params[:q])
      @posts = @search.result.page(params[:page]).per(30)

      # @l = Comment.ransack(params[:l])
      # @l.build_condition if @l.conditions.empty?
      # @comments = @l.result(distinct: true).page(params[:page]).per(20)
      # @seek = Comment.ransack(params[:l])
      # @comments = @seek.result.page(params[:page]).per(30)
    end

    def index_result
      @q = Post.ransack(params[:q])
      @q.build_condition if @q.conditions.empty?
      @posts = @q.result(distinct: true).page(params[:page]).per(20)
      @search = Post.ransack(params[:q])
      @posts = @search.result.page(params[:page]).per(30)

      # @l = Comment.ransack(params[:l])
      # @l.build_condition if @l.conditions.empty?
      # @comments = @l.result(distinct: true).page(params[:page]).per(20)
      # @seek = Comment.ransack(params[:l])
      # @comments = @seek.result.page(params[:page]).per(30)
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

