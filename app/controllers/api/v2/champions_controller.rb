class Api::V2::ChampionsController < ApplicationController
    before_action :doorkeeper_authorize!
    
    def getOne
        complete = true
        champion = [{}]
        
        selection = Answer.select('champion_id').where(player: params[:user_id], correct: true)
        
        if params[:exclude]  
          champions = Champion.select('id').where("id != ?", params[:exclude])
          
          query = "
          SELECT champions.* FROM champions
          WHERE id not in (?)
          INTERSECT
          SELECT champions.* FROM champions
          WHERE id in (?)
          "

          champion = Champion.find_by_sql([query, selection, champions])
          
          if champion.length > 0
            champion = [champion.sample]
          end
        else
          champion = Champion.where.not(id: selection).order("RANDOM()").limit(1)
        end
    
        if champion.length > 0
          complete = false
        end
    
        render json: { complete: complete, info: champion[0] }
    end
end
