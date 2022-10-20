# frozen_string_literal: true

class Property < ApplicationRecord

  STATUSES = [:booked, :unbooked]
  validates :status, presence: true

  belongs_to :user
  has_many :bookings 
  has_many :bills
  has_many :tenants, class_name: 'User'
  has_many_attached :avatar
  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :property_type, presence: true 
  validates :sharing, presence: true 
  validates :amenities_1, presence: true 
  validates :amenities_2, presence: true 
  validates :amenities_3, presence: true 
  validates :protocol_1, presence: true
  validates :protocol_2, presence: true
  validates :property_rent, presence: true 
  validates :bedrooms, presence: true 
  validates :bathrooms, presence: true 



end
