class PropertiesController < ApplicationController
  
  def index
    @user = current_user
  end
  
  def new
    @property = Property.new
    @countries = Country.all
    @regions = Region.all
    @places = Place.all
  end
  
  def show
    @property = Property.find(params[:id])
  end
  
  def edit
    @property = Property.find(params[:id])
    @countries = Country.all
    @regions = Region.all
    @places = Place.all
    
  end
  
  def create
    @user = current_user
    @property = @user.properties.create(property_params)
    if @property.save
      redirect_to action: "index"
    else
      render 'new'
    end

  end
  
  def update
    @property = Property.find(params[:id])
 
    if @property.update(property_params)
     # redirect_to @property
      redirect_to action: "index"
    else
      render 'edit'
    end
  end
 
  def update_regions
    # updates regions based on country selected
    country = Country.find(params[:country_id])
    @regions = country.regions.map{|r| [r.name, r.id]}.insert(0, "Select a Region")
  end
  
  def update_places
    # updates regions based on country selected
    region = Region.find(params[:region_id])
    @places = region.places.map{|p| [p.name, p.id]}.insert(0, "Select a Place")
  end
  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to @property
  end
  
  private
    def property_params
      params.require(:property).permit(:name, :description, :property_type_id, :country_id, :region_id, :bedrooms, :capacity)
    end
end
