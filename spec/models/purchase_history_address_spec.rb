require 'rails_helper'

RSpec.describe PurchaseHistoryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '購入ができる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_history_address).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @purchase_history_address.building = ''
        expect(@purchase_history_address).to be_valid
      end
    end

    context '購入ができない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_history_address.postal_code = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号は『３桁ハイフン４桁』でないと保存できないこと' do
        @purchase_history_address.postal_code = '123-123'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeがハイフンなしでは保存できないこと' do
        @purchase_history_address.postal_code = '1234567'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが「---」だと保存できないこと' do
        @purchase_history_address.prefecture_id = '1'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_history_address.city = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("City can't be blank")
      end

      it 'streetが空だと保存できないこと' do
        @purchase_history_address.street = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Street can't be blank")
      end

      it 'phoneが空だと保存できないこと' do
        @purchase_history_address.phone = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが12桁以上だと保存できないこと' do
        @purchase_history_address.phone = '123456789012'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end

      it 'phoneが9桁以下だと保存できないこと' do
        @purchase_history_address.phone = '123456789'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")
      end

      it 'phoneが文字列だと保存できないこと' do
        @purchase_history_address.phone = 'abcdefghij'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone is not a number")
      end
    
      it 'phoneが混合文字列だと保存できないこと' do
        @purchase_history_address.phone = '12345abcde'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone is not a number")
      end
      
      it "tokenが空では登録できないこと" do
        @purchase_history_address.token = nil
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが紐づいていなければ購入できないこと' do
        @purchase_history_address.user_id = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐づいていなければ購入できないこと' do
        @purchase_history_address.item_id = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
