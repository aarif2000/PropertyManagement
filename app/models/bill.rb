class Bill < ApplicationRecord
    validates :rent_amount, presence :true
    belongs_to :user, optional: true
    belongs_to :property, optional: true
end
