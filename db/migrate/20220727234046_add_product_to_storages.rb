class AddProductToStorages < ActiveRecord::Migration[7.0]
  def change
    add_reference :storages, :product, type: :uuid, null: false, foreign_key: true
  end
end
