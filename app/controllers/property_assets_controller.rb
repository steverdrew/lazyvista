class PropertyAssetsController < ApplicationController
  
  def index_photos
    @property = Property.find(params[:property_id])
    @property = @property.property_assets.content_asset_type_starts_with("image")
    logger.info '>>>>>>>>>>>>>>>>>>>>>>>>>It worked'
  end
  
  def edit
    @property_id = Property.find(params[:id])
  end
  
  
  def index
    @property = Property.find(params[:property_id])
    @property = @property.property_assets.content_asset_type_starts_with("image")
    @property = @propety.property_assets.asset_not_null
    logger.info '>>>>>>>>>>>>>>>>>>>>>>>>>It worked'
  end
  
  def create
    @property = Property.find(params[:property_id])
    @property_asset = @property.property_assets.create
    
    if @property_asset.save
      if @property_asset.update(property_asset_params)
        respond_to do |format|
          format.html
          format.js
        end
      end
    end 
  end
 
  def update
   
    if @property_asset.update(property_asset_params)
      respond_to do |format|
        format.html
        format.js
        flash[:notice] = "Updated property asset"
      end
    else
      render 'edit'
    end
  end
  
  def destroy
    @property = Property.find(params[:property_id])
    @property_asset = @property.property_assets.find(params[:property_id])
    @property_asset.destroy
    redirect_to edit_propety_path(@property)
  end
  
  private
  def property_asset_params
    params.require(:property_asset).permit(:asset, :description, :private)
    end
  
end
