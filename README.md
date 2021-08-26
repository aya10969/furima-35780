# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false |
| last name          | string | null: false |
| name               | string | null: false |
| last name Furigana | string | null: false |
| name Furigana      | string | null: false |
| Birthday           | date   | null: false |


### Association

- has_many :item_users
- has_many :orders



## items テーブル
 
| Column                  | Type       | Options                        |
| ------------------------| ---------- | ------------------------------ |
| Product name            | string     | null: false                    |
| explanation             | text       | null: false                    |
| Product price           | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |
| explanation             | text       | null: false                    |
| category_id             | integer    | null: false                    |
| product condition_id    | integer    | null: false                    |
| shipping charges_id     | integer    | null: false                    |
| shipping area_id        | integer    | null: false                    |
| Days to ship_id         | integer    | null: false                    |

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
- has_one : Shipping address 


##  Shipping address テーブル

| Column                        | Type    | Options      |
| ------------------------------| --------| -------------|
| Postal code                   | string  | null: false  |
| prefectures                   | string  | null: false  |
| municipalities                | string  | null: false  |
| address                       | string  | null: false  |
| Building name                 | string  |              |
| telephone number              | string  | null: false  |
| item                          | references | null: false, foreign_key: true |


### Association

- belongs_to : order