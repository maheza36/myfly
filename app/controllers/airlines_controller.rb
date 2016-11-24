class AirlinesController < ApplicationController
  def index
    @airlines = Airline.all
  end

  def new
    @airlines = Airline.new
  end

  def edit
    find_airline
    if @airlines.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to root_path
    end
  end

  def show
    find_airline
  end

  def create
    @airlines = Airline.new(airline_params)
    if @airlines.save
      flash[:success] = "Airline created. Ok"
      redirect_to airlines_path
    else
      @airlines = Airline.all
      render 'new'
    end
  end

  def update
    find_airline
    @airlines = Airline.find_by(id: params[:id])
    if @airlines.update(airline_params)
      flash[:success] = "Airlines Update. Ok"
      redirect_to airlines_path
    else
      render 'edit'
    end
  end

  def destroy
    find_airline
    if @airlines.destroy
      flash[:success] = "Airline destroyed. Ok"
    else
      flash[:error] = "Houston we are in troubles, please dont hack us."
    end
    redirect_to airlines_path
  end

  private

  def find_airline
    @airlines = Airline.find_by(id: params[:id])
  end

  def airline_params
    params.require(:airline).permit(:name)
  end


end
