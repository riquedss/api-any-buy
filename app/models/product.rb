class Product < ApplicationRecord
    has_many :Purchases
    has_many :users, through: :purchases
end
