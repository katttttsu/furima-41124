class Item < ApplicationRecord
  belongs_to :user
  has_one :Purchase_history
  has_one_attached :image

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :ategory_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true

end

def was_attached?
  self.image.attached?
end