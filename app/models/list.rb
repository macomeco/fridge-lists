class List < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }#,  uniqueness: true
    belongs_to :user
    has_many :things ,dependent: :nullify
end
