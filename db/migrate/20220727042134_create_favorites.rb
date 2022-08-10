class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites, id: :uuid do |t|

      t.timestamps
    end
  end
end
