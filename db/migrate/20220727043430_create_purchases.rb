class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :country
      t.string :city
      t.string :district
      t.string :street
      t.integer :house_number
      t.integer :kind

      t.timestamps
    end
  end
end
