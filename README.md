## Usersテーブル

|Column              |Type     |Options                    |
| -------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| birthday           | date    | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |

### Association
- has_many :items
- has_many :buy_logs


## Itemsテーブル

| Column             | Type        | Options                            |
| -------------------|------------ |------------------------------------|
| name               | string      | null: false                        |
| explanation        | text        | null: false                        |
| category_id        | integer     | null: false                        |
| condition_id       | integer     | null: false                        |
| delivery_fee_id    | integer     | null: false                        |
| region_delivery_id | integer     | null: false                        |
| days_to_deliver_id | integer     | null: false                        |
| price              | integer     | null: false                        |
| user               | references  | null: false, foreign_key: true     |

### Association

- belongs_to :user
- has one :buy_log 

## Buy_logsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル

| Column             | Type       | Options                        |
| -------------------|----------- |------------------------------- |
| postcode           | string     | null: false                    |
| region_delivery_id | integer    | null: false                    |
| city               | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| buy_log            | references | null: false, foreign_key: true |

### Association

- belongs_to :buy_log