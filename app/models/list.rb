class List < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    belongs_to :user
    has_many :things
    
    has_many :putinlists
    has_many :thinginlist ,through: :putinlists, source: :thing
end
