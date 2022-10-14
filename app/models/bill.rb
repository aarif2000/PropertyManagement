class Bill < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :property, optional: true
end
