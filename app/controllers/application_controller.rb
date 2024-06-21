class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:show, :index]
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
    def after_sign_up_path_for(resource)
        root_path
      end
      
    def correct_admin
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to root_url if @post.nil?
      end
end
