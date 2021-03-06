class PropertiesController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def index
    @user = current_user
  end
  
  def new
    @property = Property.new
    @countries = Country.where(inactive: false)
    @regions = Region.where(inactive: false)
    @places = Place.where(inactive: false)
  end
  
  def show
        
    @property = Property.find(params[:id])
    @place = Place.find(@property.place_id)
    @region = Region.find(@property.region_id)
    @country = Country.find(@property.country_id)
    @property_type = PropertyType.find(@property.property_type_id)
    @amenities = Amenity.all
    data = Array.new
    
    @amenities.each do |a|
     data << {name: a.name}
    end
    
    logger.info('>>>>>>>>>>>>>'+data.to_s);
    
    property = Property.find(params[:id])
    
    @lat = property.lat.to_s
    @lng = property.lng.to_s
    @images = property.property_assets.asset_content_type_starts_with('image')
    
    respond_to do |format|
      format.html
      format.json {render json: @amenities}
    end
    
    
  end
  
  def edit
    
    @property = Property.find(params[:id])
    @feature_types = FeatureType.order(:name)
    @features = Feature.order(:feature_type_id)
    property = Property.find(params[:id])
    
    @lat = property.lat.to_s
    @lng = property.lng.to_s
    
    #get related images
    @images = property.property_assets.asset_content_type_starts_with('image')
    
    #get related docs
    @videos = Property.find(params[:id])
    @videos = property.property_assets.asset_content_type_starts_with('video')
    
    #get related docs
    @docs = Property.find(params[:id])
    @docs = property.property_assets.asset_content_type_starts_with('application')
    
    
    if property.country_id.present? && property.country_id > 0 
      country = Country.find(property.country_id)
      @country_name = country.name.to_s
    end
    
    if property.region_id.present? && property.region_id > 0 
      region = Region.find(property.region_id)
      @region_name = region.name.to_s
    end
    
    if property.place_id.present? && property.place_id > 0 
      place = Place.find(property.place_id)
      @place_name = place.name.to_s
    end
   
  end
  
  def create
    @user = current_user
    @property = @user.properties.create(property_params)
    if @property.save
      if @property.update(property_params)
        if params[:commit] == 'Save & continue'
          redirect_to edit_property_path(@property)
          #flash[:notice] = "Your property has been saved for later"
        elsif params[:commit] == 'Save for later'
          redirect_to action: "index"
          #flash[:notice] = "Property saved"
        end
    end

    else
      render 'new'
    end  
  end
  
  def update
    @property = Property.find(params[:id])
    
    if @property.update(property_params)
      respond_to do |format|
        format.html
        format.js
      end
    else
      render 'edit'
    end
  end
  
  def update_promo_image
    @property = Property.find(params[:id])
        
    if @property.update(property_params)
      respond_to do |format|
        format.html
        format.js
        flash[:notice] = "Updated promo image"
      end
    else
      render 'edit'
    end
  end
  
  def update_general
    @property = Property.find(params[:id])
    logger.info 'working'    
    if @property.update(property_params)
      respond_to do |format|
        format.html
        format.js
        flash[:notice] = "Updated property details. #{undo_link}"
      end
    else
      render 'edit'
    end
  end
  
  def update_location
    @property = Property.find(params[:id])
        
    if @property.update(property_params)
      respond_to do |format|
        format.html
        format.js
        flash[:notice] = "Location updated. #{undo_link}"
      end
    else
      render 'edit'
    end
  end
  
  def update_regions
    # updates regions based on country selected
    #logger.info(">>>>>>>>>"+Country.find(params[:country_id]).to_s)
    if params[:country_id].present?
      country = Country.find(params[:country_id])
      @country_lat = country.lat.to_s
      @country_lng = country.lng.to_s
      @country_zoom = country.zoom.to_s
      @regions = country.regions.reject { |r| r.inactive == true }.map { |r| [r.name, r.id] }.insert(0, "")
    else
      @regions = Hash['',''] 
    end 
  end
  
  def update_places
    # updates places based on region selected
    if params[:region_id].present?
      region = Region.find(params[:region_id])
      @region_lat = region.lat.to_s
      @region_lng = region.lng.to_s
      @region_zoom = region.zoom.to_s
      @places = region.places.reject { |p| p.inactive == true }.map { |p| [p.name, p.id] }.insert(0, '')
      #@places = region.places.map{|p| [p.name, p.id]}.insert(0, "Select a Place")
    else
      @places = Hash['',''] 
    end
  end
  
  def update_map
    # get geo for place
    place = Place.find(params[:place_id])
    @place_lat = place.lat.to_s
    @place_lng = place.lng.to_s
    @place_zoom = place.zoom.to_s
  end
  
  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to @property
  end
  
  def get_country
    country = Country.find(params[:country_id])
    @country = country.map{|p| [p.name, p.id, p.lng, p.lat]}
  end
  
  
  private
    def property_params
      params.require(:property).permit(:name, :summary, :description, :property_type_id, 
        :country_id, :region_id, :place_id, :bedrooms, :capacity, :promo_image, :promo_video,
        :lat, :lng, :audience_id)
    end
    
    def undo_link
      view_context.link_to("Undo", revert_version_path(@property.versions.last), :method => :post)
    end
  
  
end
