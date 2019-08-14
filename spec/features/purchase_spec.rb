require 'rails_helper'

feature '購入機能', type: :feature do
  let(:user) {create(:user)}
  let(:item) {create(:item)}
  let!(:category1) {create(:category, id: 1, ancestry: nil)}  #親カテゴリー
  let!(:category2) {create(:category, id: 20, ancestry: "1")} #子カテゴリー
  let!(:category3) {create(:category)}                        #孫カテゴリー
  let!(:chanel_brand) {create(:brand, name: "シャネル")}
  let!(:vuitton_brand) {create(:brand, name: "ルイ ヴィトン")}
  let!(:sup_brand) {create(:brand, name: "シュプリーム")}
  let!(:nike_brand) {create(:brand, name: "ナイキ")}

  scenario '未ログイン時は購入ボタンがない' do
      # 未ログイン時には購入ボタンがない
      visit item_path(item)
      expect(page).to have_no_content('購入画面に進む')
      
      #ログイン
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input[name="commit"]').click

      # ログイン後商品詳細ページに行くと購入ボタンがある
      visit item_path(item)
      expect(page).to have_content('購入画面に進む')
    end
  end 