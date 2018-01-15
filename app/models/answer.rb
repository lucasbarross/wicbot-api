class Answer < ApplicationRecord
  belongs_to :player
  validates :player, presence: true
  belongs_to :champion
  validates :champion, presence: true
end
