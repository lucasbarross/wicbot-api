class Champion < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :representation, presence: true 
end
