# データベース設計

## Usersテーブル
|column             |type    |options                        |explain                                |
|-------------------|--------|-------------------------------|---------------------------------------|
|nickname           |string  |null: false                    |ニックネーム                             |
|email              |string  |null: false , unique: true     |メールアドレス                           |
|encrypted_password |string  |null: false                    |パスワード                              |
|first_name         |string  |null: false                    |本名の苗字                              |
|last_name          |string  |null: false                    |本名の名前                              |
|first_name_reading |string  |null: false                    |本名の苗字の読み仮名                      |
|last_name_reading  |string  |null: false                    |本名の名前の読み仮名                      |
|birthday           |date    |null: false                    |誕生日                                  |

- has_many :items
- has_many :comments
- has_many :histories


## Itemsテーブル
|column        |type           |options                        |explain                                |
|--------------|---------------|-------------------------------|------------------------------------|
|name          |string         |null: false                    |商品の名前                                |
|explain       |text           |null: false                    |商品の説明                                |
|category_id   |integer        |null: false                    |商品のカテゴリー、active_hashを使用         |
|status_id     |integer        |null: false                    |商品の状態、active_hashを使用              |
|send_cost_id  |integer        |null: false                    |どちらが、送料を負担するか、active_hashを使用 |
|prefecture_id |integer        |null: false                    |発送元の地域、active_hashを使用            |
|send_limit_id |integer        |null: false                    |発送までの日数、active_hashを使用          |
|price         |integer        |null: false                    |商品の値段                               |
|user          |references     |null: false , foreign_key: true|出品したユーザーのID                       |
|is_sold_out   |boolean        |                               |売れたかどうか、売れていればtrueになる       |

- belongs_to :user
- has_many :comments
- has_one :history


## Commentsテーブル
|column  |type       |options                        |explain                  |
|--------|-----------|-------------------------------|-------------------------|
|user    |references |null: false , foreign_key: true|コメントを投稿したユーザーのID|
|item    |references |null: false , foreign_key: true|コメントを投稿した先の商品のID|
|text    |text       |null: false                    |コメントの内容              |

- belongs_to :item
- belongs_to :user

## Addressesテーブル
|column          |type       |options                         |explain                      |
|----------------|-----------|--------------------------------|-----------------------------|
|post_number     |string     |null: false                     |郵便番号                      |
|prefecture_id   |integer    |null: false                     |発送先の地域、active_hashを使用 |
|city            |string     |null: false                     |発送先の市名                   |
|building_number |string     |null: false                     |発送先の番地                   |
|building_name   |string     |                                |発送先の建物の名前              |
|phone_number    |string     |null: false                     |電話番号                      |
|history         |references |null: false  , foreign_key: true|購入者と商品                   |

- belongs_to :history

## Historiesテーブル
|column |type      |options                        |explain           |
|-------|----------|-------------------------------|------------------|
|user   |references|null: false , foreign_key: true|配送する先のユーザー |
|item   |references|null: false , foreign_key: true|購入した商品        |

- has_one :address
- belongs_to :item
- belongs_to :user