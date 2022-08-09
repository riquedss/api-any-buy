# frozen_string_literal: true

class Storage < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end
