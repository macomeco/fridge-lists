class Theme < ApplicationRecord
    validates :clr_a, presence: true, length: { maximum: 50 }
    validates :clr_b, presence: true, length: { maximum: 50 }
    validates :clr_c, presence: true, length: { maximum: 50 }
    validates :clr_d, presence: true, length: { maximum: 50 }
    validates :clr_e, presence: true, length: { maximum: 50 }

end
