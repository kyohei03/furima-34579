# テーブル設計

##usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| family_name     | string | null: false |
| first_name      | string | null: false |
| family_name     | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

##buyersテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_code     | integer    | null: false       |
| prefecture    | string     | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building_name | string     | null: false       |
| phone_number  | string     | null: false       |
| user_id       | references | foreign_key: true |

##itemsテーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| name        | string     | null: false       |
| price       | integer    | null: false       |
| description | string     | null: false       |
| status      | string     | null: false       |
| judgment    | string     | null: false       |
| cost        | integer    | null: false       |
| days        | date       | null: false       |
| user_id     | references | foreign_key: true |

##ordersテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |