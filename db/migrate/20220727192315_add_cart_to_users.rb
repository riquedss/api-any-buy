class AddCartToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :cart, type: :uuid, null: true, foreign_key: true
  end
end
