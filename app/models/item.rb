class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_date

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :genre_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_date_id
  end
end
