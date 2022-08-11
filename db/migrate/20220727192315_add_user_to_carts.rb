class AddUserToCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :user, type: :uuid, null: true, foreign_key: true
  end
end
