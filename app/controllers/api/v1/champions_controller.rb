class Api::V1::ChampionsController < ApplicationController
  before_action :set_champion, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  # GET /champions
  def index
    @sandbox = false

    if params[:sandbox]
      if params[:sandbox] == "true"
        @sandbox = true  
      end
    end

    if params[:user_id]
      @selection = Answer.select('champion_id').where(player: params[:user_id], correct: true)
      @champions = Champion.where(sandbox: @sandbox).where.not(id: @selection)
    else
      @champions = Champion.all
    end
    render json: @champions
  end

  # GET /champions/1
  def show
    render json: @champion
  end

  # POST /champions
  def create
    @champion = Champion.new(champion_params)

    if @champion.save
      render json: @champion, status: :created
    else
      render json: @champion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /champions/1
  def update
    if @champion.update(champion_params)
      render json: @champion
    else
      render json: @champion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /champions/1
  def destroy
    @champion.destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_champion
      @champion = Champion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def champion_params
      params.require(:champion).permit(:name, :representation, :sandbox)
    end
end
