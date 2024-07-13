class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @purchase_history_address = PurchaseHistoryAddress.new
  end

  def create
    @Purchase_history_address = PurchaseHistoryAddress.new(purchase_history_params)
    if @purchase_history_address.valid?
      @purchase_history_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
  end

  private

  def purchase_history_params
    params.require(:donation_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  end
end
