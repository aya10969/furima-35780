# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | text   | null: false |
| Furigana           | text   | null: false |
| Birthday           | text   | null: false |


### Association

- has_many :item_users
- has_many :orders




## items テーブル
 
| Column                  | Type       | Options                        |
| ------------------------| ---------- | ------------------------------ |
| Product name            | string     | null: false                    |
| Product price           | text       | null: false                    |
| user                    | references | null: false, foreign_key: true |
| Category                | text       | null: false                    |
| Product condition       | text       | null: false                    |
| Shipping charges        | text       | null: false                    |
| Shipping area           | text       | null: false                    |
| Estimated shipping date | text       | null: false                    |


### Association

- belongs_to : user
- has_one : order


## orders テーブル

| Column                        | Type   | Options                            |
| ------------------------------| ------ | ---------------------------------- |
| payment                       | text       | null: false                    |
| Credit card information input | string     | null: false                    |
| Shipping address input Input  | string     | null: false                    |
| user                          | references | null: false, foreign_key: true |
| item                          | references | null: false, foreign_key: true |


### Association

- belongs_to : user
- belongs_to : item
