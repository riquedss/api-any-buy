class Cart < ApplicationRecord
    has_one :user, dependent: :destroy
end
