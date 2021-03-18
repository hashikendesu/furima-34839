# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| first_name        | string | null: false |
| family_name_kana  | string | null: false |
| first_name_name   | string | null: false |
| birstday_year     | date   | null: false |
| birstday_month    | date   | null: false |
| birstday_day      | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| text        | text       | null: false                    |
| category    | string     | null: false                    |
| status      | integer    | null: false                    |
| charges     | integer    | null: false                    |
| area        | integer    | null: false                    |
| time        | integer    | null: false                    |
| price       | integer    | null: false                    |
| commission  | integer    | null: false                    |
| profit      | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| image       | string     | null: false                    |

### Association

- belongs_to :user

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_number    | integer    | null: false                    |
| card_year      | date       | null: false                    |
| card_month     | date       | null: false                    |
| security_code  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| address        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ------------|
| post_number    | string  | null: false |
| prefecture     | integer | null: false |
| city           | string  | null: false |
| address        | string  | null: false |
| building_name  | string  | null: false |
| phone_number   | string  | null: false |

### Association

- belongs_to :order
