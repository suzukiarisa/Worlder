class UsersController < ApplicationController
  def mypage
    @user = User.find(params[:id])
    @posts = @user.posts.reverse_order
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'Updated'
      redirect_to mypage_path(@user)
    else
      flash.now[:alert] = 'Update failed'
      render 'edit'
    end
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
