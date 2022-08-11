# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :storages, dependent: :destroy
  has_many :products, through: :storages
end
