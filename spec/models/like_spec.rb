require 'rails_helper'

describe Like do
  describe '#create' do
    
    context 'いいねできない' do
      it "item_idが空だと無効" do
        like = build(:like,item_id: nil)
        like.valid?
        expect(like.errors[:item_id]).to include("を入力してください")
      end

      it "user_idが空だと無効" do
        like = build(:like, user_id: nil)
        like.valid?
        expect(like.errors[:user_id]).to include("を入力してください")
      end
    end
      
    context 'いいねできる' do
      it "両方とも存在すると有効" do
        like = build(:like)
        expect(like).to be_valid
      end
    end
  end
end
