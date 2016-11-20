class AirportsController < ApplicationController

  def index
    #@airport = Airport.all
    @airport = Airport.select('airports.id','airports.name','cities.name as city_name','cities.country_name as country_name').joins(:city)

  end

  def new
    @cities = City.all
    @airport = Airport.new
  end

  def create
    @airport = Airport.new(airport_params)
    if @airport.save
      redirect_to airports_path
    else
      render 'new'
    end
  end

  def destroy
    airport = Airport.find_by(id: params[:id])
    if airport.destroy
      flash[:success] = "Airport Destroyed Successfully"
    else
      flash[:error] = "Houston we are in troubles, please try new"
    end
    redirect_to airports_path
  end

  def edit
    @airport = Airport.find_by(id: params[:id])
  end

  def update
    @airport = Airport.find_by(id: params[:id])
    if @airport.update_attributes(airport_params)
      redirect_to airports_path
    else
      render 'new'
    end
  end

  def airport_params
    params.require(:airport).permit(:name, :city_id)
  end

end
