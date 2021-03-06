class Api::V1::AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!

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
      @status = Answer.select('player, COUNT(*)').where(correct: true).group('player').where(player: params[:user_id]).take
      if @status
        @remaining = Champion.where(sandbox: false).size - @status[:count]
        @total_tries = Answer.select('player, COUNT(*)').group('player').where(player: params[:user_id]).take;
        @total_tries = @total_tries.count
      else
        @status = {player: params[:user_id], count: 0}
        @remaining = Champion.where(sandbox: false).size
        @total_tries = 0;
      end
    else
      @status = Answer.select('player, COUNT(*)').where(correct: true).group('player')
      @remaining = "-"
      @total_tries = "-"
    end

    render json: {status: @status, total_tries: @total_tries, remaining: @remaining}
  end
  
  def lastToComplete

    @total_champions = Champion.where(sandbox: false).size
    @records = Answer.select('player, MAX(created_at) as last_guess_date').where(correct: true).group('player').having("COUNT(*) = ?", @total_champions)
    @last = @records.order("last_guess_date desc").first
    
    @total_tries = Answer.select('player, COUNT(*)').group('player').where(player: @last.player).take.count;
  
    if @last
      @res = { id: @last.player, date: @last.last_guess_date, total_tries: @total_tries }
      render json: @res
    else
      render json: "no_winner" 
    end
  end

  # DELETE /answers/reset
  def reset
    Answer.where(player: params[:user_id]).delete_all
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
