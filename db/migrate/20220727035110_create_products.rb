class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :description
      t.integer :kind
      t.string :url_image
      t.float :price

      t.timestamps
    end
  end
end
