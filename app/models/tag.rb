class Tag < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 255}#, uniqueness: true
  has_many :things ,dependent: :nullify
end
