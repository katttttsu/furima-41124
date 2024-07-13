class Address < ApplicationRecord
  belongs_to :purchase_history

  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true
end
