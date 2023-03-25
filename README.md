# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| email              | string  | null: false|
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
| user_id               | reference | null: false , foreign_key: true|
| product_price         | integer| null: false |
| category_id         　| integer | null: false, foreign_key: true |
| condition_id          | integer | null: false |
| delivery_pay_id       | integer | null: false |
| city_id               | integer      | null: false|
| delivery_span_id      | integer | null: false |


### Association

- belongs_to :user
- has_one :sails_records


## sails_records テーブル

| Column          | Type       | Options                       |
| ------          | ---------- | ------------------------------|
| user　　　　　    | reference 　　| foreign_key: true, null: false |
| items 　　　      | reference 　　| foreign_key: true, null: false |

### Association

- belongs_to :users
- belongs_to :item
- belongs_to :address


## addresses テーブル

| Column            | Type       | Options     　　　　　　　　　　　|
| -------           | ---------- | ------------　　　　　　　　　　　|
| postal_code       | string     | null: false 　　　　　　　　　　　|
| city_id           | integer    | null: false                  |
| block             | string     | null: false 　　　　　　　　　　　|
| house number      | string     | null: false 　　　　　　　　　　　|
| building_name     | string     | 　　　　　　　|
| phone_num         | string     | null: false 　　　　　　　　　　　|
| user_id           | string | null: false , foreign_key: true|

### Association

- belongs_to :item
- belongs_to :sails_records