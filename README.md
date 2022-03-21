## Usersテーブル

|Column            |Type     |Options                    |
| -----------------|---------|---------------------------|
| nickname         | string  | null: false               |
| email            | string  | null: false, unique: true |
| password         | string  | null: false               |
| password_confirm | string  | null: false               |
| birthday         | date    | null: false               |
| last_name        | string  | null: false               |
| first_name       | string  | null: false               |
| last_name_kana   | string  | null: false               |
| first_name_kana  | string  | null: false               |

### Association
- has_many :items
- has_many :buy_log through: :addresses


## Itemsテーブル

| Column          | Type    | Options                            |
| ----------------|---------|------------------------------------|
| name            | string  | null: false                        |
| explanation     | string  | null: false                        |
| category        | string  | null: false                        |
| condition       | string  | null: false                        |
| delivery_fee    | integer | null: false                        |
| region_delivery | string  | null: false                        |
| days_to deliver | string  | null: false                        |
| price           | string  | null: false                        |
| user            | references  | null: false, foreign_key: true |

### Association

- belongs_to :users
- has one :buy_log through: :addresses

## Buy_logテーブル

| Column          | Type    | Options                            |
| --------------- | ------- | ----------------------------
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## Addressesテーブル

| Column          | Type    | Options                            |
| ----------------|---------|------------------------------------|
| postcode | string | null: false |
| region | string | null: false |
| city | string | null: false |
| street_address | string | null: false |
| building_name | string | null: false |
| phone_number | string | null: false |

### Association

- belongs_to :buy_log
- belongs_to :items