class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
# devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。
	  before_action :configure_permitted_parameters, if: :devise_controller?

	  def after_sign_in_path_for(resource)
	  	user_path(current_user)
	  end

	  protected
# devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。
	  def configure_permitted_parameters
	    added_attrs = [ :email, :name, :password, :password_confirmation ]
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	  end


end
