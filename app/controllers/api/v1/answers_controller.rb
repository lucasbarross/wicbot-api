class Api::V1::AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!, except: [:ranking]

  # GET /answers
  def index
    @answers = Answer.all

    render json: @answers
  end

  # GET /answers/1
  def show
    render json: @answer
  end

  # POST /answers
  def create
    if Answer.where(player: params[:player], champion_id: params[:champion_id], correct: true).exists?
      render json: { status: :unprocessable_entity } and return
    end
    
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
  end

  # GET /status
  def status
    
    if params[:user_id]
      @status = Answer.select('player, COUNT(*)').where(correct: 1).group('player').where(player: params[:user_id])
      if @status.exists?
        @remaining = Champion.all.size - @status[0][:count]
        @total_tries = Answer.select('player, COUNT(*)').group('player').where(player: params[:user_id]);
      else
        @remaining = Champion.all.size
        @total_tries = 0;
      end
    else
      @status = Answer.select('player, COUNT(*)').where(correct: 1).group('player')
      @remaining = "-"
      @total_tries = "-"
    end

    render json: {status: @status, total_tries: @total_tries, remaining: @remaining}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:player, :champion_id, :correct, :hinted)
    end
end
