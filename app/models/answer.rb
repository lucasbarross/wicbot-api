class Answer < ApplicationRecord
  validates :player, presence: true
  belongs_to :champion
  validates :champion, presence: true
end
