class Devise::Custom::RegistrationsController < Devise::RegistrationsController
 
  def new
    super # no customization, simply call the devise implementation
  end

  def create
    super # no customization, simply call the devise implementation
  end

  def update
    super # no customization, simply call the devise implementation 
  end
  
  def update_avatar
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      respond_to do |format|
        format.html
        format.js
        flash[:notice] = "Updated user"
      end
    else
      render 'edit'
    end
  end
  
  protected
  
  
  
end