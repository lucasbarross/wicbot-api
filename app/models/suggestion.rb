class Suggestion < ApplicationRecord
    validates :champion_name, isChampion: true
    validates :representation, isEmoji: true
end
