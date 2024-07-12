class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless @item.sold? && @item.user_id == current_user.id
      redirect_to root_path, alert: "この商品の編集は許可されていません。"
    end
  end
  
  def destroy
    if @item.sold? && @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path, notice: "商品を削除しました。"
    else
      redirect_to root_path, alert: "この商品の削除は許可されていません。"
    end
  end
  
  def sold?
    buyer_id.present?
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end