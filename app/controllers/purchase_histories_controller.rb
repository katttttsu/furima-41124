class PurchaseHistoriesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect_if_sold, only: [:index, :create]
  before_action :redirect_if_own_item, only: [:index, :create]


  def index
    @purchase_history_address = PurchaseHistoryAddress.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_params)
    if params[:token].present? && @purchase_history_address.valid?
      pay_item
      @purchase_history_address.save
      redirect_to root_path, notice: 'Purchase completed.'
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_history_address).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_history_params[:token],
      currency: 'jpy'
    )
  end

    def redirect_if_sold
    redirect_to root_path, alert: 'This item is already sold.' if @item.sold?
  end

  def redirect_if_own_item
    redirect_to root_path, alert: 'You cannot purchase your own item.' if user_signed_in? && @item.user == current_user
  end

end