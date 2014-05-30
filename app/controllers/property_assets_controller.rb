class PropertyAssetsController < ApplicationController
  respond_to :js, :html
 
  def create
    
    @property = Property.find(params[:property_id])
    @property_asset = @property.property_assets.create
    
    property = Property.find(params[:property_id])
    @images = property.property_assets.asset_content_type_starts_with('image')
    @videos = property.property_assets.asset_content_type_starts_with('video')
    @docs = property.property_assets.asset_content_type_starts_with('application')
    
    if @property_asset.save
      if @property_asset.update(property_asset_params)
          respond_to do |format|
            format.html
            format.js
                        
          flash[:notice] = "File added"
        end
    end
    end 
  end
 
  def update
    if @property_asset.update(property_asset_params)
      respond_to do |format|
        format.html
        format.js{ }
        flash[:notice] = "Updated property asset"
      end
    else
      render 'edit'
    end
  end
  
  def destroy
    @property = Property.find(params[:property_id])
    @property_asset = @property.property_assets.find(params[:id])
    @property_asset.destroy
    
    property = Property.find(params[:property_id])
    @images = property.property_assets.asset_content_type_starts_with('image')
    @videos = property.property_assets.asset_content_type_starts_with('video')
    @docs = property.property_assets.asset_content_type_starts_with('application')
    
    
    respond_to do |format|
    format.html
    format.js
      flash[:notice] = "Deleted"
    end
  end
  
  private
  def property_asset_params
    params.require(:property_asset).permit(:asset, :description, :private)
    end
  
end
