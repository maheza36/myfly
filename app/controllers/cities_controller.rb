class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def edit
    find_city
    if @city.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to root_path
    end
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path
    else
      flash[:success] = "City created. Ok"
      render 'new'
    end
  end

  def destroy
    find_city
    if @city.destroy
      flash[:success] = "City Destroyed Successfully"
    else
      flash[:error] = "Houston we are in troubles, please try it later"
    end
    redirect_to cities_path
  end

  def update
    find_city
    if @city.update(city_params)
      flash[:success] = "City updated. Ok"
      redirect_to cities_path
    else
      flash[:error] = "Houston we are in troubles, try it again."
      render 'edit'
    end
  end


  def show
    find_city
    if @city.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to root_path
    end
  end

  private

  def find_city
    @city = City.find_by(id: params[:id])
  end

  #strong parameters
  def city_params
    params.require(:city).permit(:name, :country_name, :time_zone)
  end


end
