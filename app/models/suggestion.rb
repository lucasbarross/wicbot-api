class Suggestion < ApplicationRecord
    validates :champion_name, champion: true
    validates :representation, emoji: true
end
