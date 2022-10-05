class Property < ApplicationRecord
    belongs_to :user 
    # validates :name, presence: true
    # validates :description, presence: true
    # validates :city, presence: true
    # validates :address, presence: true 
end
