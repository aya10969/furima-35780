# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| name               | string | null: false |
| last_name_furigana | string | null: false |
| name_furigana      | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :items
- has_many :orders



## items テーブル
 
| Column                  | Type       | Options                        |
| ------------------------| ---------- | ------------------------------ |
| product_name            | string     | null: false                    |
| product_price           | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |
| explanation             | text       | null: false                    |
| category_id             | integer    | null: false                    |
| product_condition_id    | integer    | null: false                    |
| shipping_charge_id      | integer    | null: false                    |
| prefecture_id           | integer    | null: false                    |
| days_to_ship_id         | integer    | null: false                    |

### Association

- belongs_to : user
- has_one : order



## orders テーブル

| Column                        | Type       | Options                        |
| ------------------------------| ---------- | -------------------------------|
| user                          | references | null: false, foreign_key: true |
| item                          | references | null: false, foreign_key: true |


### Association

- belongs_to : user
- belongs_to : item
- has_one : shipping_address 


##  shipping_addresses テーブル

| Column                        | Type    | Options      |
| ------------------------------| --------| -------------|
| postal_code                   | string  | null: false  |
| prefecture_id                 | integer | null: false  |
| municipalities                | string  | null: false  |
| address                       | string  | null: false  |
| building_name                 | string  |              |
| telephone_number              | string  | null: false  |
| order                         | references | null: false, foreign_key: true |


### Association

- belongs_to : order