class Api::V1::ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :update, :destroy]

  def index
    if params[:resort_id]
      @apartments = Resort.find(params[:resort_id]).apartments
    else
      @apartments = Apartment.all
    end
    render json: { apartments: @apartments }, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @apartment
  end

  # POST /apartments
  def create
    @apartment = Apartment.new(apartment_params)
    if @apartment.save!
      render json: @apartment.as_json, status: :created
    else
      render json: {apartment: @apartment.errors, status: :no_content}
    end
  end

  def update
    if @apartment.update(apartment_params)
      render json: @apartment
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @apartment.destroy
    render json: { deleted_apartment: @apartment,
                   code: 200,
                   status: :success,
    }, except: [:created_at, :updated_at]
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.permit(:room_type, :description, :resort_id)
  end
end