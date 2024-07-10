require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.create(:user)  # FactoryBotを使用してユーザーを作成
    @item = FactoryBot.build(:item, user: @user)  # アイテムにユーザーを割り当てる
  end
  
  describe "新規出品登録" do

    context '新規出品が出来る時' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end


    context '新規出品が出来ない時' do

      it '画像が空であれば登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明が空では登録できない' do
        @explanation = FactoryBot.build(:item, explanation: '')
        @explanation.valid?
        expect(@explanation.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが「---」では登録できない' do
        @category_id = FactoryBot.build(:item, category_id: 1 )
        @category_id.valid?
        expect(@category_id.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品状態が「---」では登録できない' do
        @item = FactoryBot.build(:item, condition_id: 1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料が「---」では登録できない' do
        @item = FactoryBot.build(:item, shipping_charge_id: 1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end

      it '配送元が「---」では登録できない' do
        @item = FactoryBot.build(:item, prefecture_id: 1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '配送日が「---」では登録できない' do
        @item = FactoryBot.build(:item, shipping_date_id: 1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end

      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が300円以下では登録できない' do
        item = FactoryBot.build(:item, price: 299)
        item.valid?
        expect(item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格が9999999円以上では登録できない' do
        item = FactoryBot.build(:item, price: 10000000)
        item.valid?
        expect(item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'userが紐づいてなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
