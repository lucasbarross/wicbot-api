class Api::V1::LocalizationsController < ApplicationController
  before_action :set_localization, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  # GET /localizations
  def index
    if params[:hash] && params[:lang]
      @localizations = Localization.where(hash_text: params[:hash], lang: params[:lang]) 
    else
      @localizations = Localization.all
    end
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
      render json: @localization, status: :created
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

  def hint
    hintCount = Answer.select("count(DISTINCT champion_id)").where(player: params[:player_id], hinted: true)
    
    if hintCount.count > 3
      message = Localization.where(hash_text: "noHintText", lang: params[:lang]).first
      render json: message  
    else
      hint = Localization.where(hash_text: params[:hash], lang: params[:lang]).first
      render json: hint
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_localization
      @localization = Localization.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def localization_params
      params.require(:localization).permit(:lang, :hash_text, :text)
    end
end
