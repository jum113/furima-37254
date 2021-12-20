class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :delivery_area_id, :municipality, :address, :building, :telephone_number

  with_options presence: true do
    validates :user_id, :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality, :address
    validates :telephone_number, format: { with: /\A[0-9]{10, 11}\z/, message: "is invalid. Exclude hyphen(-)" }
  end