# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# テーブル設計


## Usersテーブル
| Column                      | Type    | Options     |
| mail_address                | string  | null: false |
| nick_name                   | string  | null: false |
| encrypted_password          | string  | null: false |
| full_width_family_name      | string  | null: false |
| full_width_first_name       | string  | null: false |
| full_width_kana_family_name | string  | null: false |
| full_width_kana_first_name  | string  | null: false |
| date                        | integer | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchases
- has_many :sending_destinations


## Itemsテーブル
| Column             | Type       | Options           |
| status             | string     | null: false       |
| description        | string     | null: false       |
| user_id            | references | foreign_key: true |
| price              | integer    | null: false       |
| currency           | integer    | null: false       |
| condition_id       | integer    | active_hash       |
| prefecture_id      | integer    | active_hash       |
| delivery_charge_id | integer    | active_hash       |
| shipping_date_id   | integer    | active_hash       |

### Association
- belongs_to :user
- has_many   :comments
- has_many   :categories
- has_many   :brands
- has_one    :purchase


## Categoriesテーブル
| Column | Type       | Options     |
| Name   | string     | null: false |

### Association
- has_many :items


## sending destinationsテーブル 
| Column        | Type       | Options     |
| uder_id       | references | null: false |
| prefecture_id | integer    | active_hash |
| post_code     | string     | null: false |
| city          | string     | null: false |
| street        | string     | null: false |
| building_name | string     | -           |
| house_number  | string     | null: false |
| phone_number  | string     | null: false |

### Association
- belongs_to :purchase


## commentsテーブル 中間テーブル
| Column     | Type       | Options     |
| item_id    | references | null: false |
| uder_id    | references | null: false |
| comment    | text       | null: false |
| created_at | timestamp  | null: false |

### Association
- belongs_to :user
- belongs_to :item


## purchasesテーブル 中間テーブル
| Column       | Type       | Options                 |
| item         | references | foreign_key :item, true |
| user         | references | foreign_key :user, true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :sending_destination