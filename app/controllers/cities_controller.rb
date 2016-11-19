class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path
    else
      render 'new' #cargar la vista new
    end
  end

  def destroy
    city = City.find_by(id: params[:id])
    if city.destroy
      flash[:success] = "City Destroyed Successfully"
    else
      flash[:error] = "Houston we are in troubles, please try new"
    end
    binding.pry
    redirect_to cities_path

  end

  def city_params
    params.require(:city).permit(:name, :country_name, :time_zone)
  end

end
