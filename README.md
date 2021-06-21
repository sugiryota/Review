# SoundReview
## 音声レビューの投稿サイトです。
## レビューしたいものについて音声で紹介ができ、また閲覧ができます。 
![Uploading スクリーンショット 2021-06-21 15.18.04.png…]()
















# テーブル設計

## users テーブル

| Column            | Type       | Options                 |
| ----------------- | ---------- | ----------------------- |
| nickname          | string     | null: false             |
| email             | string     | null: false,unique:true |
| encrypted_password| string     | null: false             |




### Association

- has_many  :items
- has_many  :comments
- has_many  :likes
- has_many :followers
- has_many :followings
- has_many :follower_users
- has_many :following_users
- has_many :passive_notifications
- has_many :active_notifications



## items テーブル

| Column              | Type        | Options         |
| ------------------- | ----------- | --------------- |
| name                | string      | null: false     | 
| text                | text        |                 |
| audio               | string      | null: false     |
| category_id         | integer     | null: false     |
| url                 | string      |                 | 
| user                | references  |foreign_key:true |

### Association

- belongs_to  :user
- has_many    :comments
- has_many    :likes
- has_many :notifications, dependent: :destroy


## comments テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| comment     | text       | null: false |
| user        | references |             |
| item        | references |             |
| audiocomment| string     |             |

### Association

- belongs_to  :user
- belongs_to  :item

## likes テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| item_id     | integer    | null: false |
| user_id     | integer    | null: false |


### Association

- belongs_to  :user
- belongs_to  :item

## relationships テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| follower_id | integer    | null: false |
| following_id| integer    | null: false |


### Association

- belongs_to :follower
- belongs_to :following

## notifications テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| visiter_id  | integer    |             |
| visited_id  | integer    |             |
| item_id     | integer    |             |
| message_id  | integer    |             |
| action      | string     |             |
| checked     | boolean    | null: false |


### Association

- belongs_to :item
- belongs_to :message
- belongs_to :visiter
- belongs_to :visited