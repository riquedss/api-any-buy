# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :Purchases, dependent: :nullify
  has_many :users, through: :purchases
  has_many :storages, dependent: :nullify
  has_many :carts, through: :storages
  has_many :favorites, dependent: :destroy
  has_many :user, through: :favorites

  enum kind: { konsol_game: 0, laptop: 1, smartphone: 2 }
end
