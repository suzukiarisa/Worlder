class UsersController < ApplicationController
  def mypage
    @user = User.find(params[:id])
    @posts = @user.posts.reverse_order
  end

  def edit
  end

  def update
  end

private
  def user_params
    params.require(:user).permit(:nickname, :gender_id, :image, :created_at, :age, :residence_id, :introduction, :email)
  end

  def post_params
    params.require(:post).permit(:user_id, :image, :created_at, :title, :body, category_ids: [])
  end

  def password_params
    params.require(:user).permit(:password,:password_confirmation)
  end

  def currect_user
    @user = User.find(params[:id])
    if @user != current_user
	  redirect_to user_path(current_user.id)
	end
  end
end
