class AddCartToStorages < ActiveRecord::Migration[7.0]
  def change
    add_reference :storages, :cart, null: false, foreign_key: true
  end
end
