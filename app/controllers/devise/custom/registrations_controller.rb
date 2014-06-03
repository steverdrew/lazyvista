class Devise::Custom::RegistrationsController < Devise::RegistrationsController
 
  before_filter :configure_permitted_parameters, if: :devise_controller?

  respond_to :html, :js
  
  def new
    super # no customization, simply call the devise implementation
  end

  def create
    super # no customization, simply call the devise implementation
  end

  def update
    
    @user = User.find(current_user.id)
    
    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to :back
    else
      render "edit"
    end
  end

  def update_avatar
    
    @user = current_user
    
    if @user.update(user_params)
      redirect_to :back
    else
      render 'edit'
    end
  end
  
  protected
    
    def user_params
      params.require(:user).permit(:avatar)
    end

    def needs_password?(user, params)
      user.email != params[:user][:email] ||
      params[:user][:password].present?
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
    end
  end
  

end