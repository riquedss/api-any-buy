class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases, id: :uuid do |t|
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
