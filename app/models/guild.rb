class Guild < ApplicationRecord
    validates server_id, presence: true, uniqueness: true
    validates nationality, presence: true
    validates name, presence: true
end
