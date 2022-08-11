class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts, id: :uuid do |t|
      t.float :total, default: 0

      t.timestamps
    end
  end
end
