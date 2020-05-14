class Thing < ApplicationRecord
  validates :content, presence: true, length: { maximum: 50 }
  validates :deadline, presence: true
  validates :quantity, presence: true, length: { maximum: 50 }
  
  belongs_to :user
  belongs_to :tag
  belongs_to :list

  def list_in(list) #thing.list_in(list)
    putinlists.find_or_create_by(list_id: list.id)
  end
  
  def list_out(list)
    putinlist = putinlists.find_by(list_id: list.id)
    putinlist.destroy if putinlist 
  end
  
  def list_in?(list)#リストに入っているかどうか
    listofthings.include?(list)
  end
end
