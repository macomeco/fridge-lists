class Colortheme < ApplicationRecord
    validates :clr_main, presence: true, length: { maximum: 50 }
    validates :clr_sub, presence: true, length: { maximum: 50 }
    validates :clr_list_i, presence: true, length: { maximum: 50 }
    validates :clr_list_ii, presence: true, length: { maximum: 50 }
    validates :clr_font, presence: true, length: { maximum: 50 }
end
