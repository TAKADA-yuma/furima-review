# DB設計

## usersテーブル

| Column             | Type    | Options                   |
| :----------------- | :-----: | :----------------------   |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: ture |
| password           | string  | null: false               |
| first-name         | string  | null: false               |
| last-name          | string  | null: false               |
| first-name-kana    | string  | null: false               |
| last-name-kana     | string  | null: false               |
| year               | integer | null: false               |
| month              | integer | null: false               |
| day                | integer | null: false               |

#### Association
- has_many :items
- has_many :orders
- has_one :card

## itemsテーブル

| Column               | Type       | Options           |
| :------------------- | :--------: | :---------------- |
| name                 | string     | null: false       |
| price	               | integer    | null: false       |
| info                 | text       | null: false       |
| category             | string     | null: false       |
| scheduled-delivery   | string     | null: false       |
| shipping-fee         | string     | null: false       |
| prefecture           | string     | null: false       |
| status               | string     | null: false       |
| user                 | references | foreign_key: true |

#### Association
- belongs_to :users
- has_one :order

## cardsテーブル

| Column           | Type       | Options           |
| :--------------- | :--------: | :---------------- |
| card-number      | integer    | null: false       |
| expiration-month | integer    | null: false       |
| expiration-year  | integer    | null: false       |
| cvv              | integer    | null: false       |
| user             | references | foreign_key: true |

#### Association
- belongs_to :users

## addressesテーブル

| Column         | Type       | Options           |
| :------------- | :--------: | :---------------- |
| postal-code    | string     | null: false       |
| prefecture     | string     | null: false       |
| city           | string     | null: false       |
| address        | string     | null: false       |
| building       | string     | null: false       |
| phone-number   | integer    | null: false       |
| order          | references | foreign_key: true |

#### Association
- belongs_to :orders

## odersテーブル

| Column   | Type       | Options           |
| :------- | :--------: | :---------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

#### Association
- belongs_to :users
- belongs_to :items
- has_one :address