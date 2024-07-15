class AddPriceToPurchaseHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :purchase_histories, :price, :integer
  end
end
