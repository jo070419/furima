# README

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_logs


## items テーブル
| Column             | Type         | Options                                     |
| ------------------ | ------------ | ------------------------------------------- |
| name               | string       | null: false                                 |
| description        | text         | null: false                                 |
| category_id        | integer      | null: false                                 |
| condition_id       | integer      | null: false                                 |
| shipping_fee_id    | integer      | null: false                                 |
| shipping_from_id   | integer      | null: false                                 |
| shipping_day_id    | integer      | null: false                                 |
| price              | integer      | null: false                                 |
| user               | references   | null: false, null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase_log


## purchase_logs テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery_address


## delivery_addresses テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| post_code            | string     | null: false                    |
| prefecture           | string     | null: false                    |
| municipality         | string     | null: false                    |
| house_number         | string     | null: false                    |
| building             | string     |                                |
| phone_number         | string     | null: false                    |
| purchase_log         | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_log