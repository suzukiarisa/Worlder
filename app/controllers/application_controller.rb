class ApplicationController < ActionController::Base
    #deviseで利用出来るパラメーターを設定
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

   #  def set_search
	  # @search = Article.ransack(params[:q])
	  # @search_articles = @search.result.page(params[:page])
   #  end

    def  configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :nickname, :gender_id, :age, :Residence_id, :introduction])
	end

	def after_sign_in_path_for(resource)
	    root_path
	end

	def after_sign_out_path_for(resource)
       root_path
    end
end
