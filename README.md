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
| email                       | string  | null: false |
| nick_name                   | string  | null: false |
| encrypted_password          | string  | null: false |
| family_name                 | string  | null: false |
| first_name                  | string  | null: false |
| kana_family_name            | string  | null: false |
| kana_first_name             | string  | null: false |
| date                        | date    | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


## Itemsテーブル
| Column             | Type       | Options           |
| name               | string     | null: false       |
| description        | text       | null: false       |
| user               | references | foreign_key: true |
| price              | integer    | null: false       |
| condition_id       | integer    | null: false       | ##active_hash##
| prefecture_id      | integer    | null: false       | ##active_hash##
| delivery_charge_id | integer    | null: false       | ##active_hash##
| shipping_date_id   | integer    | null: false       | ##active_hash##
| category_id        | string     | null: false       | ##active_hash##

### Association
- belongs_to :user
- has_many   :comments
- has_one    :purchase


## sending destinationsテーブル 
| Column        | Type       | Options           |
| purchase      | references | foreign_key: true |
| prefecture_id | integer    | null: false       | ##active_hash##
| post_code     | string     | null: false       |
| city          | string     | null: false       |
| street        | string     | null: false       |
| building_name | string     | -                 |
| house_number  | string     | null: false       |
| phone_number  | string     | null: false       |

### Association
- belongs_to :purchase


## commentsテーブル 中間テーブル
| Column     | Type       | Options          |
| item       | references | oreign_key: true |
| user       | references | oreign_key: true |
| comment    | text       | null: false      |
| created_at | timestamp  | null: false      |

### Association
- belongs_to :user
- belongs_to :item


## purchasesテーブル 中間テーブル
| Column       | Type       | Options           |
| item         | references | foreign_key: true |
| user         | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :sending_destination