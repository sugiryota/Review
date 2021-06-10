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


## comments テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| text        | text       | null: false |
| user        | references |             |
| item        | references |             |

### Association

- belongs_to  :user
- belongs_to  :item