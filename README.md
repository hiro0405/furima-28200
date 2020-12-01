# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family name        | string  | null: false               |
| first name         | string  | null: false               |
| family name(kana)  | string  | null: false               |
| first name(kana)   | string  | null: false               |
| birthday           | date    | null: false               |

### Association
--has_many: items
--has_many: purchase

## items テーブル

| Column                  | Type     | Options                        |
| ----------------------- | -------- | ------------------------------ |
| name                    | string   | null: false                    |
| description             | text     | null: false                    |
| category                | string   | null: false                    |
| status                  | string   | null: false                    |
| price                   | integer  | null: false                    |
| shipping charge         | string   | null: false                    |
| shipping area           | string   | null: false                    |
| estimated shipping date | string   | null: false                    |
| Listing date            | datetime |                                |
| user_id                 | integer  | null: false, foreign_key: true |

### Association
--belongs_to: users
--has_one: purchase

## purchase テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| user_id      | integer | null: false, foreign_key: true |
| item_id      | integer | null: false, foreign_key: true |

### Association
--belongs_to: users
--belongs_to: purchase
--has_one: shipping address

## shipping address テーブル

| Column        | Type    | Options                        |
| ------------- | --------| ------------------------------ |
| zip code      | integer | null: false                    |
| prefectures   | string  | null: false                    |
| municipality  | string  | null: false                    |
| address       | string  | null: false                    |
| building name | string  |                                |
| tel number    | integer | null: false                    |
| purchase_id   | integer | null: false, foreign_key: true |

### Association
--belongs_to: purchase