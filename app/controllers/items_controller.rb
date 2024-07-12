class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:create, :new, :edit, :update]
  before_action :check_user, only: [:edit, :update]
  
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
      render :new
    end
  end

  def show
  end

  def edit
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
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
  
  def check_user
    unless current_user == @item.user
      redirect_to root_path, alert: "この商品の編集は許可されていません。"
    end
  end
end