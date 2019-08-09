require 'rails_helper'
describe Image do
  describe '#create' do
    it "imageが空だと登録できない" do
      image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("を入力してください")
    end
  end
end