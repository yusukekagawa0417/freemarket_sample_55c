module ApplicationHelper
  # 商品編集ページにて手数料の表示
  def display_mercari_fee(item)
    fee = (item.price * 0.1).floor
    "¥#{fee.to_s(:delimited)}"
  end

  # 商品編集ページにて利益の表示
  def display_seller_gain(item)
    fee = (item.price * 0.1).floor
    "¥#{(item.price - fee).to_s(:delimited)}"
  end

  # 購入確認ページにてカードの有効期限表示
  def display_card_expiration_date(card)
    exp_month = card.exp_month.to_s
    exp_year = card.exp_year.to_s.slice(2, 3)
    "#{exp_month} / #{exp_year}"
  end
end