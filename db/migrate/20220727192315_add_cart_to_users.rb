class AddCartToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :cart, null: false, foreign_key: true
  end
end
