# frozen_string_literal: true

class Property < ApplicationRecord
  has_many_attached :avatar
  belongs_to :user
  # validates :name, presence: true
  # validates :description, presence: true
  # validates :city, presence: true
  # validates :address, presence: true
end
