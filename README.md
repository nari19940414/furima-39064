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
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many  :items
- has_many  :sails_record
- has_one   :addresses

## items テーブル

| Column                | Type   | Options     |
| ------                | ------ | ----------- |
| product_name          | string | null: false |
| product_description   | text   | null: false |
| name_id               | string | null: false , foreign_key: true|
| product_price         | integer| null: false |
| category         　　　| string | null: false |
| condition         　　　| string | null: false |
| delivery_pay         | string | null: false |
| delivery_region       | string | null: false |
| delivery_span         | string | null: false |
| product_price         | integer| null: false |

### Association

- has_many :address
- has_many :items
- belongs_to :user
- has_one :purchase_date
- belongs_to :item


## sails_records テーブル

| Column          | Type       | Options                       |
| ------          | ---------- | ------------------------------|
| id 　　　　　　　　| integer 　　| primary_key, not null, auto_increment |
| name_id 　　　　　| integer 　　| foreign_key: true, null: false |
| product_id 　　　| integer 　　| foreign_key: true, null: false |
| purchase_date 　| date 　　　　| null: false |

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
| postal_code       | string     | null: false |
| city              | string      | null: false,foreign_key: true |
| block             | string     | null: false 　　　　　　　　　　　|
| building_name     | string     | null: false 　　　　　　　　　　　|
| phone_num         | string     | null: false 　　　　　　　　　　　|
| name_id           | string | null: false , foreign_key: true|

### Association

- has_one   :addresses