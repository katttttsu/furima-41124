class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
  belongs_to :buyer, class_name: "User", optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }

  validates :item_name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :user, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  def sold?
    buyer_id.present?
  end
end

def was_attached?
  self.image.attached?
end