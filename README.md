# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
--has_many: items
--has_many: purchases

## items テーブル

| Column                     | Type    | Options                        |
| -------------------------- | ------- | ------------------------------ |
| name                       | string  | null: false                    |
| description                | text    | null: false                    |
| category_id                | integer | null: false                    |
| status_id                  | integer | null: false                    |
| price                      | integer | null: false                    |
| shipping_charge_id         | integer | null: false                    |
| shipping_area_id           | integer | null: false                    |
| estimated_shipping_date_id | integer | null: false                    |
| user_id                    | integer | null: false, foreign_key: true |

### Association
--belongs_to: user
--has_one: purchase

## purchase テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association
--belongs_to: user
--belongs_to: purchase
--has_one: shipping_address

## shipping_address テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| zip_code       | string  | null: false                    |
| prefectures_id | integer | null: false                    |
| municipality   | string  | null: false                    |
| address        | string  | null: false                    |
| building_name  | string  |                                |
| tel_number     | string  | null: false                    |
| purchase_id    | integer | null: false, foreign_key: true |

### Association
--belongs_to: purchase