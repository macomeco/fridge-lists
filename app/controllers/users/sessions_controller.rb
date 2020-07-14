class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  
  def new_guest
    user = User.guest
    sign_in user
    flash[:success] = 'ゲストログインしました。'
    redirect_to root_path
  end
  
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
  
  def failed
  flash[:error] = 'メールアドレスかパスワードが間違っています'
  redirect_to root_path
  end
  
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  #   def destroy
  #    super
  #   end

  protected
  
  def auth_options
    { scope: resource_name, recall: "#{controller_path}#failed" }
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
