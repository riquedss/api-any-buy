class AddKindToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :kind, :integer, default: 0
  end
end
