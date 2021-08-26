# データベース設計

## Usersテーブル
|column      |type    |options                                                                   |explain                                |
|------------|--------|--------------------------------------------------------------------------|---------------------------------------|
|id          |integer |null: false                                                               |自動で生成されるID                        |
|nickname    |string  |null: false                                                               |ニックネーム                             |
|email       |string  |null: false                                                               |メールアドレス                            |
|password    |string  |null: false , format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}     |パスワード                               |
|name        |string  |null: false                                                               |本名                                    |
|name_reading|string  |null: false, format:{with: /\A[ァ-ヶー－]+\z/}                             |本名の読み仮名                            |
|birth_year  |integer |null:false, format:{with: /\A[0-9]+\z/}, numericality: {only_intger: true}|誕生日の年                               |
|birth_month |integer |null:false, format:{with: /\A[0-9]+\z/}, numericality: {only_intger: true}|誕生月                                   |
|birthday_day|integer |null:false, format:{with: /\A[0-9]+\z/}, numericality: {only_intger: true}|誕生日                                   |
|point       |integer |null:false, format:{with: /\A[0-9]+\z/}, numericality: {only_intger: true}|所有しているポイント、登録当初は0ポイントとなる |

- has_many :items
- has_many :comments


## Itemsテーブル
|column     |type           |options       |explain                                |
|-----------|---------------|--------------|------------------------------------|
|id         |integer        |null: false|自動で生成されるID                                |
|name       |string         |null: false , length{maximum: 75}|商品の名前                                |
|explain    |text           |           |商品の説明                                |
|category   |integer        |null: false|商品のカテゴリー、active_hashを使用         |
|status     |integer        |null: false|商品の状態、active_hashを使用              |
|send_cost  |integer        |null: false|どちらが、送料を負担するか、active_hashを使用 |
|send_from  |integer        |null: false|発送元の地域、active_hashを使用            |
|send_limit |integer        |null: false|発送までの日数、active_hashを使用          |
|price      |integer        |null: false , numericality: {only_integer: true, :greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999}|商品の値段|
|user_id    |integer        |null: false|出品したユーザーのID                       |
|image      |active storage |null: false|画像、Active Storageを使用                |

- belongs_to :user
- has_many :comments


## Commentsテーブル
|column  |type    |options     |explain                  |
|--------|--------|------------|-------------------------|
|id      |integer |null: false |自動で生成されるID          |
|user_id |integer |null: false |コメントを投稿したユーザーのID|
|item_id |integer |null: false |コメントを投稿した先の商品のID|
|text    |text    |null: false |コメントの内容              |

- belongs_to :item
- belongs_to :user

## Addressテーブル
|column          |type    |options                                                                                 |explain                      |
|----------------|--------|----------------------------------------------------------------------------------------|-----------------------------|
|post_number     |integer |null: false                                                                             |郵便番号                      |
|prefecture      |integer |null:false, format:{with: /\A[0-9]+\z/}, numericality: {only_intger: true}              |発送先の地域、active_hashを使用 |
|city            |string  |null: false                                                                             |発送先の市名                   |
|building_number |string  |null: false                                                                             |発送先の番地                   |
|building_name   |string  |                                                                                        |発送先の建物の名前              |
|phone_number    |integer |null: false , null:false, format:{with: /\A[0-9]+\z/}, numericality: {only_intger: true}|電話番号                      |
|id              |integer |null: false                                                                             |自動で生成されるID              |
|item_id         |integer |null: false                                                                             |配送する商品のID               |
|user_id         |integer |null: false                                                                             |配送する先のユーザー            |

- belongs_to :user
- belongs_to :item