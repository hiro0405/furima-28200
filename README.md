# テーブル設計

## users テーブル

| Column       | Type    | Options                   |
| ----------   | ------- | ------------------------- |
| nickname     | string  | null: false               |
| mail address | string  | null: false, unique: true |
| password     | string  | null: false               |
| name         | string  | null: false               |
| name(kana)   | string  | null: false               |
| birthday     | integer | null: false               |

### Association
--has_many: items
--has_many: purchase

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| image        | string     | null: false                    |
| description  | string     | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| price        | integer    | null: false                    |
| Listing date | datetime   |                                |
| user_id      | references | null: false, foreign_key: true |

### Association
--belongs_to: users
--has_one: purchase

## purchase テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |
| purchase day | datetime   |                                |

### Association
--belongs_to: users
--belongs_to: purchase
--has_one: shipping address

## shipping address テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| zip code    | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| tel number  | integer    | null: false                    |
| purchase_id | references | null: false, foreign_key: true |

### Association
--belongs_to: purchase