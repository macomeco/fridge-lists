class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,  :validatable
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
    
    def self.guest
        find_or_create_by!(email: 'guest@mail.com',name: 'げすと',theme: 'sodapop') do |user|
            user.password = SecureRandom.urlsafe_base64
        end
    end

end
