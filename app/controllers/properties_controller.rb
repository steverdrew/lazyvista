class PropertiesController < ApplicationController
  
  def index
    @properties = Property.all
  end
  
  def new
    @property = Property.new
  end
  
  def show
    @property = Property.find(params[:id])
  end
  
  def edit
    @property = Property.find(params[:id])
  end
  
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property
    else
      render 'new'
    end

  end
  
  def update
    @property = Property.find(params[:id])
 
    if @property.update(property_params)
      redirect_to @property
    else
      render 'edit'
    end
  end
  
  private
    def property_params
      params.require(:property).permit(:name, :description)
    end
end
