require 'rails_helper'

describe Receipt do
  describe '#create' do

    context '購入記録残らない' do
      it "item_idが空だと無効" do
        receipt = build(:receipt, item_id: nil)
        receipt.valid?
        expect(receipt.errors[:item_id]).to include("を入力してください")
      end

      it "seller_idが空だと無効" do
        receipt = build(:receipt, seller_id: nil)
        receipt.valid?
        expect(receipt.errors[:seller_id]).to include("を入力してください")
      end

      it "buyer_idが空だと無効" do
        receipt = build(:receipt, buyer_id: nil)
        receipt.valid?
        expect(receipt.errors[:buyer_id]).to include("を入力してください")
      end
    end
    
    context '購入記録残る' do
     it "上記全て存在すると有効" do
      receipt = build(:receipt)
      expect(receipt).to be_valid
      end
    end

  end
end
