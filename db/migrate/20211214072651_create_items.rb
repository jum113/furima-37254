class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name               , null: false
      t.text :description          , null: false
      t.integer :price             , null: false
      t.references :user           , null: false, foreign_key: true
      t.integer :genre_id          , null: false
      t.integer :status_id         , null: false
      t.integer :delivery_charge_id, null: false
      t.integer :delivery_area_id  , null: false
      t.integer :delivery_date_id  , null: false
      t.timestamps
    end
  end
end
