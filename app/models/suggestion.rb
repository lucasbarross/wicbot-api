class Suggestion < ApplicationRecord
    validates :champion_name, isChampion: true
end
