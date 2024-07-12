class Address < ApplicationRecord
  belongs_to :purchase_history

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true
end
