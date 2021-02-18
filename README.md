# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### association
- has_many :items
- has_many :orders

## buyersテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| post_code        | string     | null: false       |
| prefecture_id    | string     | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| order            | references | foreign_key: true |

### association
- has_many :orders
- belongs_to :prefecture_id

## itemsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       |
| price          | integer    | null: false       |
| description    | string     | null: false       |
| status_id      | integer    | null: false       |
| judgment_id    | integer    | null: false       |
| cost_id        | integer    | null: false       |
| days_id        | integer    | null: false       |
| prefecture_id  | integer    | null: false       |
| user           | references | foreign_key: true |

### association
- has_many :orders
- belongs_to :user
- belongs_to :status_id
- belongs_to :judgment_id
- belongs_to :cost_id
- belongs_to :days_id
- belongs_to :prefecture_id

## ordersテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### association
- belongs_to :items
- belongs_to :users
- belongs_to :buyers