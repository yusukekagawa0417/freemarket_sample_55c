require 'rails_helper'

feature '購入機能', type: :feature do
  let(:user) {create(:user)}
  let(:item) {create(:item)}
  let!(:chanel_brand) {create(:brand, name: "シャネル")}
  let!(:vuitton_brand) {create(:brand, name: "ルイ ヴィトン")}
  let!(:sup_brand) {create(:brand, name: "シュプリーム")}
  let!(:nike_brand) {create(:brand, name: "ナイキ")}

  scenario '未ログイン時は購入ボタンがない' do
      # 未ログイン時に出品ボタンを押すとログインページに遷移
      visit item_path(item)
      expect(page).to have_no_content('購入画面に進む')
      
      #ログイン
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input[name="commit"]').click

      # emailとpasswordを入力しクリックすると出品ページに遷移
      visit item_path(item)
      expect(page).to have_content('購入画面に進む')
    end
  end 