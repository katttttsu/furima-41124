class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]
  before_action :prevent_access_to_purchase_histories_page, only: [:index, :create]

  def index
    @purchase_history_address = PurchaseHistoryAddress.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render 'orders/index'
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_params)
    if params[:token].present? && @purchase_history_address.valid?
      pay_item
      @purchase_history_address.save
      update_item_buyer
      redirect_to root_path, notice: '購入が完了しました。'
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'orders/index', status: :unprocessable_entity
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_history_address).permit(:price, :token, :postal_code, :prefecture_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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

  def update_item_buyer
    @item.update(buyer_id: current_user.id)
  end

  def update_item_buyer
    @item.update(buyer_id: current_user.id)
  end

  def user_can_purchase?
    if current_user.nil?
      false
    elsif current_user == @item.user
      true
    else
      false
    end
  end

  def user_can_purchase?
    !current_user.nil? && (@item.buyer_id.nil? || current_user == @item.user)
  end

  def prevent_access_to_purchase_histories_page
    if request.path == item_purchase_histories_path(@item) && !user_can_purchase?
      redirect_to root_path, alert: 'This page access is restricted.'
    end
  end
end