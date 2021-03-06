# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_many :items dependent: destroy
- has_many :comments dependent: destroy
- has_many :item_transactions 


## destinations テーブル

| Column           | Type    | Options                       |
| ---------------- | ------- | ----------------------------- |
| post_code        | string  | null: false                   |
| prefecture       | integer | null: false                   | 
| city             | string  | null: false                   |
| adress           | string  | null: false                   |
| building_name    | string  |                               |
| phone_number     | string  | null: false                   |
| item_transaction_id   | integer | null: false, foreign_key:true |


### Association

- belongs_to :item_transaction


## items テーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| name               | string  | null: false                   |
| price              | integer | null: false                   | 
| description        | text    | null: false                   |
| item_condition_id  | integer | null: false                   |
| category_id        | integer | null: false                   |
| shipping_cost_id   | integer | null: false                   |
| shipping_date_id   | integer | null: false                   |
| shipping_origin_id | integer | null: false                   |

### Association

- belongs_to :user 
- has_one :transacition
- has_many :images dependent: :destroy
- has_many :comments dependent: :destroy


## comments テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| text    | string  |                                |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## images テーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |                   
| item_image | string  | null: false                    |
| item_id    | integer | null: false, foreign_key: true |

### Association

- belongs_to :item

## transactions テーブル

| Column  | Type    | Options                        |
| --------| ------- | ------------------------------ |                   
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination




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
