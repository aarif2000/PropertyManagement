class Subscription < ApplicationRecord
    belongs_to :user 
    has_one :booking
end
