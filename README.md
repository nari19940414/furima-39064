# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| email              | string  | null: false,unique:true|
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date | null: false |


### Association

- has_many  :items
- has_many  :sails_records


## items テーブル

| Column                | Type   | Options     |
| ------                | ------ | ----------- |
| product_name          | string | null: false |
| product_description   | text   | null: false |
| user               | references | null: false,foreign_key: true |
| product_price         | integer| null: false |
| category_id         　| integer | null: false|
| condition_id          | integer | null: false |
| delivery_pay_id       | integer | null: false |
| city_id               | integer      | null: false|
| delivery_span_id      | integer | null: false |


### Association

- belongs_to :user
- has_one :sails_record


## sails_records テーブル

| Column          | Type       | Options                       |
| ------          | ---------- | ------------------------------|
| user　　　　　    | references　　| foreign_key: true, null: false |
| item 　　　      | references　　| foreign_key: true, null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column            | Type       | Options     　　　　　　　　　　　|
| -------           | ---------- | ------------　　　　　　　　　　　|
| postal_code       | string     | null: false 　　　　　　　　　　　|
| city_id           | integer    | null: false                  |
| block             | string     | null: false 　　　　　　　　　　　|
| house number      | string     | null: false 　　　　　　　　　　　|
| building_name     | string     | 　　　　　　　　　　　　　　　　　　　|
| phone_number         | string     | null: false 　　　　　　　　　　　|
| sails_record          | string | null: false |

### Association

- belongs_to :sails_record