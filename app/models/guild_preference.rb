class GuildPreference < ApplicationRecord
  belongs_to :guild
  validates :guild, presence: true
end
