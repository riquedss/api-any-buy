class Product < ApplicationRecord
    has_many :Purchases
    has_many :users, through: :purchases
    has_many :storages
    has_many :carts, through: :storages
end
