### DB設計

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
|icon_image|string||
|profile|text||

#### Association

- has_one :address, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_manu :evaluations, dependent: :destroy

### addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address_number|string||
|building_name|string||
|user_id|refernces|null: false, foreign_key: true|

#### Association

- belongs_to :user

### itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|category_id|references|null: false, foreign_key: true|
|condition|integer|null: false|
|shipping_fee|integer|null: false|
|prefecture_id|integer|null: false|
|shipping_date|integer|null: false|
|price|integer|null: false|
|seller_id|references|null: false, foreign_key: { to_table: :users }|
|buyer_id|references|foreign_key: { to_table: :users }|
|status|integer|null: false|
|size|integer||
|brand_id|references|foreign_key: true|

#### Association

- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :messages, dependent: :destroy
- belongs_to :user
- belongs_to :category
- belongs_to :brand

### imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_image|string|null: false|
|item_id|references|null: false, foreign_key: true|

#### Association

- belongs_to :item

### likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

#### Association

- belongs_to :item
- belongs_to :user

### messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

#### Association

- belongs_to :item
- belongs_to :user

### evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null: false|
|comment|text||
|user_id|references|null: false, foreign_key: true|

#### Association

- belongs_to :user

### brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

#### Association

- has_many :categories, through: :brand_categories
- has_many :brand_categories
- has_many :items

### categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|ancestry|string||

#### Association

- has_many :brands, through: :brand_categories
- has_many :brand_categories
- has_many :items

### brand_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

#### Association

- belongs_to :brand
- belongs_to :category
