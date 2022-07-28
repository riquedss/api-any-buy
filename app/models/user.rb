class User < ApplicationRecord
    belongs_to :cart, optional: true
    has_many :Purchases
    has_many :products, through: :purchases
    has_many :favorites, dependent: :destroy
    has_many :product, through: :favorites

    has_secure_password

    enum kind: { "user": 0, "adm": 1 }
end
