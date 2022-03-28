# README

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

### Association
- has_many :items
- has_many :purchase_logs


## items テーブル
| Column             | Type         | Options                                     |
| ------------------ | ------------ | ------------------------------------------- |
| name               | string       | null: false                                 |
| description        | text         | null: false                                 |
| category           | string       | null: false                                 |
| condition          | string       | null: false                                 |
| shipping_fee       | string       | null: false                                 |
| shipping_from      | string       | null: false                                 |
| shipping_day       | string       | null: false                                 |
| price              | string       | null: false                                 |
| user               | references   | null: false, null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase_log


## purchase_logs テーブル
| Column | Type       | Options                                     |
| ------ | ---------- | ------------------------------------------- |
| user   | references | null: false, null: false, foreign_key: true |
| item   | references | null: false, null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery_address


## delivery_addresses テーブル
| Column       | Type       | Options                                     |
| ------------ | ---------- | ------------------------------------------- |
| post_code    | string     | null: false                                 |
| prefecture   | string     | null: false                                 |
| municipality | string     | null: false                                 |
| house_number | string     | null: false                                 |
| building     | string     |                                             |
| phone_number | string     | null: false                                 |
| item         | references | null: false, null: false, foreign_key: true |

### Association
- belongs_to :purchase_log