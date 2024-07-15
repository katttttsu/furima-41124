class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :redirect_if_sold, only: [:edit, :update, :destroy]
  
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
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def redirect_if_sold
    @item = Item.find(params[:id])
    if @item.sold?
      redirect_to root_path, alert: "This item has already been sold."
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :image, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def check_user
    unless current_user == @item.user
      redirect_to root_path, alert: "You are not authorized to edit this item."
    end
  end

end