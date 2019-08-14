crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do |user|
  link "マイページ", user_path(current_user)
end

crumb :search do
  link "検索結果", searches_fuzzy_search_path
end

crumb :detail do |item|
  link item.name, item_path(item)
end

crumb :profile do
  link "プロフィール", edit_registration_path
  parent :mypage
end

crumb :credit do
  link "支払い方法", new_credit_path
  parent :mypage
end

crumb :confirmation do |user|
  link "本人情報の登録", edit_user_path(current_user)
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_user_path
  parent :mypage
end

crumb :selling_items do |user|
  link "出品した商品 - 出品中", selling_user_path(current_user)
  parent :mypage
end

crumb :selling_items_edit do |item|
  link "出品商品画面", seller_item_path(item)
  parent :selling_items
end
