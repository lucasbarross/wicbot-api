class Guild < ApplicationRecord
    validates guild_id, presence: true, uniqueness: true
    validates nationality, presence: true
    validates name, presence: true
end
