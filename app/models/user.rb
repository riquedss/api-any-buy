class User < ApplicationRecord
    belongs_to :cart
    has_many :Purchases
    has_many :products, through: :purchases
end
