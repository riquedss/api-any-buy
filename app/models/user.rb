# frozen_string_literal: true

class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :purchases
  has_many :products, through: :purchases
  has_many :favorites, dependent: :destroy
  has_many :product, through: :favorites

  has_secure_password

  enum kind: { user: 0, adm: 1 }
end
