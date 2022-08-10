class AddCartToStorages < ActiveRecord::Migration[7.0]
  def change
    add_reference :storages, :cart, type: :uuid, null: false, foreign_key: true
  end
end
