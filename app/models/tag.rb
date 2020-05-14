class Tag < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false }
  has_many :things ,dependent: :nullify
end
