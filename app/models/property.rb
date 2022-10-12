# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :user
  has_many :bookings 
  has_many :tenants, class_name: 'User'
  has_many_attached :avatar
  # validates :name, presence: true
  # validates :city, presence: true
  # validates :address, presence: true
end
