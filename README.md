# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name_id            | string | null: false |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_one  :sails_record

## items テーブル

| Column                | Type   | Options     |
| ------                | ------ | ----------- |
| product_id            | string | null: false |
| product_name          | string | null: false |
| product_price         | string | null: false |
| product_description   | string | null: false |
| name_id               | string | null: false , foreign_key: true|

### Association

- has_many :shipping_address
- 

## sails_record テーブル

| Column          | Type       | Options                       |
| ------          | ---------- | ------------------------------|
| sails_id        | string     | null: false                   |
| name_id         | string     | null: false, foreign_key: true|
| product_id      | string     | null: false, foreign_key: true|
| purchase_date   | string     | null: false                   |

### Association

- belongs_to :users
- has_many :shipping_address
- 

## shipping_address テーブル

| Column            | Type       | Options     　　　　　　　　　　　|
| -------           | ---------- | ------------　　　　　　　　　　　|
| product_id        | string     | null: false,foreign_key: true |
| sails_id          | string     | null: false,foreign_key: true |
| shipment_id       | string     | null: false 　　　　　　　　　　　|
| purchased_at      | references | null: false 　　　　　　　　　　　|
| shipping_address  | references | null: false 　　　　　　　　　　　|
| shipping_status   | references | null: false 　　　　　　　　　　　|
### Association

- belongs_to :items