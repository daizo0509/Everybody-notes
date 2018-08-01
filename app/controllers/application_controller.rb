class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  	before_action :configure_permitted_parameters, if: :devise_controller?
  	before_action :set_search
  		
  	def after_sign_in_path_for(resource)

	  case resource
      when User
				# new_destination_path
				root_path
      when Admin
        admin_page_top_path
      end
	end
	
	def after_sign_out_path_for(resource)
	 	root_path
	end

  		private
	 	def set_search
	       @search = Tagging.ransack(params[:q])
	  	end

  		protected
  			def configure_permitted_parameters
    			devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  			end

end
