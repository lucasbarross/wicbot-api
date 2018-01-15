class Localization < ApplicationRecord
    validates :lang, presence: true
    validates :hash, presence: true
    validates :text, presence: true
end
