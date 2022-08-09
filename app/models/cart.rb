# frozen_string_literal: true

class Cart < ApplicationRecord
  has_one :user, dependent: :destroy
  has_many :storages, dependent: :destroy
  has_many :products, through: :storages
end
