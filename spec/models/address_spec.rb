require 'rails_helper'
describe Address do
  describe '#create' do
    it "is invalid without a postal_code" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a city" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a address_number" do
      address = build(:address, address_number: "")
      address.valid?
    expect(address.errors[:address_number]).to include("を入力してください")
    end

    it "is valid with  all column" do
    create(:user)
      address = build(:address)
      address.valid?
      expect(address).to be_valid
    end
  end
end