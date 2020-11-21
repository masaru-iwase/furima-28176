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




## Usersテーブル
| Column | Type       | Options                        |
| mail_address | string | null: false |
| nick_name | string | null: false |
| user_id | integer | null: false |

### Association
- has_many :selling_items
- has_many :buying_items
- has_many :comments
- has_many :purchases
- has_many :sending_destinations
- has_one :profile



## Itemsテーブル
| Column | Type       | Options                        |
| status | string | null: false |
| item_id | string | null: false |
| description | string | null: false |
| uder_id | integer | null: false |
| price | integer | null: false |
| currency | integer | null: false |
| category | references | null: false, foreign key:true |
| condition | string | null: false |
| prefecture Gem jp_prefecture
| delivery_charge | string | null: false |
| shipping_date | string | null: false |

### Association
- belongs_to :user
- has_many :comments
- has_many :categories
- has_many :brands
- has_one :purchase



## Categoriesテーブル
| Column | Type       | Options                        |
| Name | string | null: false |

### Association
- has_many :items



## Brandsテーブル
| Column | Type       | Options                        |
| Name | string | null: false |

### Association
- has_many :items



## Profilesテーブル
| Column | Type       | Options                        |
| full_width_name | string | null: false |
| full_width_kana_name | string | null: false |
| birthdate | integer | null: false |

### Association
- belongs_to :user



## sending destinationsテーブル 
| Column | Type       | Options                        |
| uder_id | references | null: fal
| destination_family_name | string | null: false
| destination_first_name | string | null: false |
| prefecture Gem jp_prefecture
| post_code | integer | null: false |
| city | string | null: false |
| street | string | null: false |
| building_name | string | - |
| house_number | string | - |
| phone_number | string | - |
| mail_adress | references | - |

### Association
- belongs_to :user
- has_many :purchases



## commentsテーブル 中間テーブル
| Column | Type       | Options                        |
| item_id | references | null: false |
| uder_id | references | null: false |
| comment | text | null: false |
| created_at | timestamp | null: false |

### Association
- belongs_to :user
- belongs_to :item



## purchasesテーブル 中間テーブル
| Column | Type       | Options                        |
| item_id | references | null: false |
| uder_id | references | null: false |
| purchased_on | timestamp | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_one :sending_destination