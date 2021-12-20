class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string     :post_code,        null: false
      t.integer    :delivery_area_id, null: false
      t.string     :municipality,     null: false
      t.string     :address,          null: false
      t.string     :building
      t.string     :telephone_number, null: false
      t.references :order,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
