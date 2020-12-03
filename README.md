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
--has_many: purchases

## items テーブル

| Column                  | Type     | Options                        |
| ----------------------- | -------- | ------------------------------ |
| name                    | string   | null: false                    |
| description             | text     | null: false                    |
| category_id             | integer  | null: false                    |
| status_id               | integer  | null: false                    |
| price                   | integer  | null: false                    |
| shipping charge_id      | integer  | null: false                    |
| shipping area_id        | integer  | null: false                    |
| estimated shipping date | integer  | null: false                    |
| user_id                 | integer  | null: false, foreign_key: true |

### Association
--belongs_to: user
--has_one: purchase

## purchase テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| user_id      | integer | null: false, foreign_key: true |
| item_id      | integer | null: false, foreign_key: true |

### Association
--belongs_to: user
--belongs_to: purchase
--has_one: shipping address

## shipping address テーブル

| Column         | Type    | Options                        |
| -------------- | --------| ------------------------------ |
| zip code       | string  | null: false                    |
| prefectures_id | integer | null: false                    |
| municipality   | string  | null: false                    |
| address        | string  | null: false                    |
| building name  | string  |                                |
| tel number     | string  | null: false                    |
| purchase_id    | integer | null: false, foreign_key: true |

### Association
--belongs_to: purchase