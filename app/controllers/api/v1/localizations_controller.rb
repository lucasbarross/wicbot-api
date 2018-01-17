class Api::V1::LocalizationsController < ApplicationController
  before_action :set_localization, only: [:show, :update, :destroy]

  # GET /localizations
  def index
    @localizations = Localization.all

    render json: @localizations
  end

  # GET /localizations/1
  def show
    render json: @localization
  end

  # POST /localizations
  def create
    @localization = Localization.new(localization_params)

    if @localization.save
      render json: @localization, status: :created, location: @localization
    else
      render json: @localization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /localizations/1
  def update
    if @localization.update(localization_params)
      render json: @localization
    else
      render json: @localization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /localizations/1
  def destroy
    @localization.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_localization
      @localization = Localization.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def localization_params
      params.require(:localization).permit(:lang, :hash, :text)
    end
end