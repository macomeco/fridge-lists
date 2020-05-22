class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name, presence: true, length:{maximum: 50}
#=begin
    validates :email,   presence: true, length:{maximum: 255},
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                        uniqueness: {case_sensitive: false }        
#=end
    #has_secure_password
    
    validates :theme, presence: true, length:{maximum: 50}
    
    has_many :tags
    has_many :lists
    has_many :things
    #has_many :colorthemes    

end
