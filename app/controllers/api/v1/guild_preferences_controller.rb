class Api::V1::GuildPreferencesController < ApplicationController
  before_action :set_guild_preference, only: [:show, :update, :destroy]

  # GET /guild_preferences
  def index
    @guild_preferences = GuildPreference.all

    render json: @guild_preferences
  end

  # GET /guild_preferences/1
  def show
    render json: @guild_preference
  end

  # POST /guild_preferences
  def create
    @guild_preference = GuildPreference.new(guild_preference_params)

    if @guild_preference.save
      render json: @guild_preference, status: :created, location: @guild_preference
    else
      render json: @guild_preference.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guild_preferences/1
  def update
    if @guild_preference.update(guild_preference_params)
      render json: @guild_preference
    else
      render json: @guild_preference.errors, status: :unprocessable_entity
    end
  end

  # DELETE /guild_preferences/1
  def destroy
    @guild_preference.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guild_preference
      @guild_preference = GuildPreference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def guild_preference_params
      params.require(:guild_preference).permit(:guild_id, :lang)
    end
end
