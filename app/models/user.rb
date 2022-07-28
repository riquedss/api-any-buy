class User < ApplicationRecord
    belongs_to :cart
    has_many :Purchases
    has_many :products, through: :purchases
    has_many :favorites, dependent: :destroy
    has_many :product, through: :favorites
end
