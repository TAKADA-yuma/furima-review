class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  has_one_attached :image

  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { only_integer: true, greater_than_or_equal_to: 0 } do
    validates :category_id,           numericality: { less_than_or_equal_to: 9 }
    validates :status_id,             numericality: { less_than_or_equal_to: 5 }
    validates :shipping_fee_id,       numericality: { less_than_or_equal_to: 1 }
    validates :prefecture_id,         numericality: { less_than_or_equal_to: 46 }
    validates :scheduled_delivery_id, numericality: { less_than_or_equal_to: 2 }
  end
end
