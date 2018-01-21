class GuildsController < ApplicationController
  before_action :set_guild, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  # GET /guilds
  def index
    @guilds = Guild.all

    render json: @guilds
  end

  # GET /guilds/1
  def show
    render json: @guild
  end

  # POST /guilds
  def create
    @guild = Guild.new(guild_params)

    if @guild.save
      render json: @guild, status: :created
    else
      render json: @guild.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guilds/1
  def update
    if @guild.update(guild_params)
      render json: @guild
    else
      render json: @guild.errors, status: :unprocessable_entity
    end
  end

  # DELETE /guilds/1
  def destroy
    @guild.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guild
      @guild = Guild.find(params[:guild_id])
    end

    # Only allow a trusted parameter "white list" through.
    def guild_params
      params.require(:guild).permit(:guild_id, :name, :nationality)
    end
end
