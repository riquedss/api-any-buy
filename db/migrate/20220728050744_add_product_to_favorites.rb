class AddProductToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_reference :favorites, :product, type: :uuid, null: false, foreign_key: true
  end
end
