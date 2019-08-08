require 'rails_helper'
describe Address do
  describe '#create' do
    it "is invalid without a postal_code" do
      address = build(:address, postal_code: "")
      expect(address.errors[:postal_code]).to include("郵便番号を入力してください")
    end
    end
    it "is invalid without a prefecture_id" do
      address = build(:address, prefectire_id: nil)
      expect(address.errors[:postal_code]).to include("")
    end
    it "is invalid without a city" do
      address = build(:address, city: "")
      expect(address.errors[:postal_code]).to include("市区町村を入力してください")
    end
    it "is invalid without a address_number" do
      address = build(:address, address_number: "")
    expect(address.errors[:postal_code]).t o include("番地を入力してください")
    end
    it "is valid with  all column" do
      address = build(:address)
      expect(address).to be_valid
    end
  end
end