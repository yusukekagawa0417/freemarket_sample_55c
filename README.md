# アプリの名前

 メルカリ コピーサイト  

## 説明
 
 概要資料を用意していますので、下記までお問い合わせください。  
 y_kagawa0417@yahoo.co.jp  

 
## デプロイ
 AWS  
 http://54.178.143.127/
   
## DB設計

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birthday|date|null: false|
|tel|string|unique: true|
|icon_image|string| |
|profile|text| |
|customer|string|null: false|
|card|string|null: false|

#### Association

- has_one :address, dependent: :destroy
- has_one :sns_credential, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :receipts, dependent: :destroy
- has_many :likes, dependent: :destroy

### addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building_name|string| |
|user_id|references|null: false, foreign_key: true|

#### Association

- belongs_to :user

### sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association

- belongs_to :user

### itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|condition|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_method|integer|null: false|
|shipping_date|integer|null: false|
|prefecture_id|integer|null: false|
|price|integer|null: false|
|seller_id|references|null: false, foreign_key: { to_table: :users }|
|status|integer|null: false|

#### Association

- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_one  :receipt, dependent: :destroy
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to :category
- belongs_to :brand, optional: true

### imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

#### Association

- belongs_to :item

### receiptsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: { to_table: :users }|
|seller_id|references|null: false, foreign_key: { to_table: :users }|

#### Association

- belongs_to :item
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'

### brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

#### Association

- has_many :items

### categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|ancestry|string|　|

#### Association

- has_many :items


### likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

#### Association

- belongs_to :item
- belongs_to :user
