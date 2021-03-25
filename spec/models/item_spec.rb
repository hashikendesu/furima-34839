require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報の入力がうまくいかない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'statuが未選択だと出品できない' do
        @item.statu_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Statu must be other than 1")
      end
      it 'chargeが未選択だと出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")
      end
      it 'areaが未選択だと出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it 'delivery_timeが未選択だと出品できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが設定範囲以外だと出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
