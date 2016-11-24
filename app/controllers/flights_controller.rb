class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def new
    @flights = Flight.new
    @airports = Airport.all
    @airlines = Airline.all
  end

  def edit
    find_airline
    @airports = Airport.all
    @airlines = Airline.all
    if @flights.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to root_path
    end
  end

  def show
    find_airline
  end

  def create
    @flights = Flight.new(flight_params)
    #binding.pry para pruebas
    if @flights.save
      flash[:success] = "Flights created. Ok"
      redirect_to flights_path
    else
      @airports = Airport.all
      @airlines = Airline.all
      render 'new'
    end

  end

  def update
    find_airline
    @airports = Airport.all
    @airlines = Airline.all
  end

  def delete
    find_airline
  end

  private

  def find_airline
    @flights = Flight.find_by(id: params[:id])
  end

  def flight_params
    params.require(:flight).permit(:origin_airport_id, :destination_airport_id, :periodicity, :periodicity_time, :avg_time, :airline_id)
  end

end
