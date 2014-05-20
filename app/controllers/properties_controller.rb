class PropertiesController < ApplicationController
  
  def index
    @user = current_user
  end
  
  def new
    @property = Property.new
    @countries = Country.where(inactive: false)
    #@regions = Region.where(inactive: false)
    #@places = Place.where(inactive: false)
  end
  
  def show
    @property = Property.find(params[:id])
  end
  
  def edit
    @property = Property.find(params[:id])
    @countries = Country.where(inactive: false)
    @regions = Region.where(inactive: false)
    @places = Place.where(inactive: false)
  end
  
  def create
    @user = current_user
    @property = @user.properties.create(property_params)
    if @property.save
      if @property.update(property_params)
        if params[:commit] == 'Save and continue'
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
      redirect_to action: "index"
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
      @regions = country.regions.reject { |r| r.inactive == true }.map { |r| [r.name, r.id] }.insert(0, "Select a Region")
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
      @places = region.places.reject { |p| p.inactive == true }.map { |p| [p.name, p.id] }.insert(0, "Select a Place")
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
      params.require(:property).permit(:name, :description, :property_type_id, 
        :country_id, :region_id, :place_id, :bedrooms, :capacity, :promo_image, :promo_video,
        :lat, :lng)
    end
end
