class AddProductToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :product, type: :uuid, null: false, foreign_key: true
  end
end
