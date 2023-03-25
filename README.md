# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| email              | string  | unique: true|
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday         | integer | null: false |


### Association

- has_many  :items
- has_many  :sails_record


## items テーブル

| Column                | Type   | Options     |
| ------                | ------ | ----------- |
| product_name          | string | null: false |
| product_description   | text   | null: false |
| user_id               | string | null: false , foreign_key: true|
| product_price         | integer| null: false |
| category_id         　　　| string | null: false |
| condition_id         　　　| integer | null: false |
| delivery_pay_id         | integer | null: false |
| delivery_region_id       | integer | null: false |
| delivery_span_id         | integer | null: false |


### Association

- belongs_to :user
- has_one :purchase_date


## sails_records テーブル

| Column          | Type       | Options                       |
| ------          | ---------- | ------------------------------|
| user_id 　　　　　| integer 　　| foreign_key: true, null: false |
| items_id 　　　| integer 　　| foreign_key: true, null: false |

### Association

- belongs_to :users
- belongs_to :item
- has_many :address
- has_many :purchase_date
- has_one :purchase_date
- belongs_to :purchase_date


## addresses テーブル

| Column            | Type       | Options     　　　　　　　　　　　|
| -------           | ---------- | ------------　　　　　　　　　　　|
| postal_code       | string     | null: false 　　　　　　　　　　　|
| city              | string      | null: false,foreign_key: true |
| block             | string     | null: false 　　　　　　　　　　　|
| house number      | string     | null: false 　　　　　　　　　　　|
| building_name     | string     | null: false 　　　　　　　　　　　|
| phone_num         | string     | null: false 　　　　　　　　　　　|
| name_id           | string | null: false , foreign_key: true|

### Association

- has_one   :addresses