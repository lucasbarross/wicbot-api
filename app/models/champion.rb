class Champion < ApplicationRecord
    validates :name, presence: true
    validates :representation, presence: true 
end
