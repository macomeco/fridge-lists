class List < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }, uniqueness: {case_sensitive: false }
    belongs_to :user
    has_many :things ,dependent: :nullify
    
    has_many :putinlists
    has_many :thinginlist ,through: :putinlists, source: :thing
end
