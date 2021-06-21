# SoundReview
## 1. 概要
#### 音声レビューの投稿サイトです。
#### レビューしたいものについて音声で紹介ができ、また閲覧ができます。 
<img width="1199" alt="スクリーンショット 2021-06-21 15 18 04" src="https://user-images.githubusercontent.com/83449662/122715504-ef3a2700-d2a3-11eb-93d5-f5fcf00882bb.png">

## 2. URL

## 3. テスト用アカウント
### ・アカウント
#### email    : a@g.com
#### password : hoge1234


## 4. 利用方法

### ・レビュー投稿
#### テスト用アカウントでログイン→トップページからレビュー投稿ボタン押下→レビュー情報入力→レビュー投稿
### ・レビュー確認
#### トップページからレビュー検索→レビュー選択



## 5. 目指した課題解決
#### 車を運転している時だったり料理をしている時運動している時に聞くことでスマホやパソコンの画面が見ることができなくても情報のアップデートができる。

## 6. 要件定義

| 優先順位（高：3、中：2、低：1 ) | 機能        | 目的        | 詳細           | ストーリー     | 見積もり(所用時間) |
| --------------------------- | ---------- | ---------- | -------------- | ------------ | --------------- |
| 3                           |DB設計|deviseを用いたユーザー管理機能| 必要テーブルusers/items/messages |  |4|
| 3            | ユーザー管理機能   | null: false,unique:true | トップページ右上にログイン、新規登録ボタンを表示させる。ログイン時はログアウトボタンを表示|レビューを投稿したいユーザーは、ログインもしくは新規登録をする必要がある| 4|
| 3   |レビュー投稿機能|レビューを投稿する| 投稿ページには、カテゴリー、音声レビュー、作品名を入力してもらう |一覧ページのPostReviewからレビューを投稿する |3|
| 3   |レビュー一覧機能|ユーザーにどんなレビューがあるのか表示する| 一覧には画像、作品名、投稿者名、投稿日時を表示させる |レビュー一覧から聞きたいレビューを選択する |3|
| 3   |レビュー詳細表示機能|ユーザーにレビューの内容表示する| 一覧には画像、作品名、投稿者名、投稿日時、音声レビューを表示させる |レビューの内容を聞く |3|
| 3   |レビュー編集機能|レビューの書き換えができるようにする| 投稿内容を書き換える |投稿したものに対して気になったところや追加したいと思った時に編集を行う |3|
| 3   |レビュー削除機能|レビューの削除ができるようにする| 詳細ページの削除ボタンを押すと削除することができる |レビューを削除したい時に使う |3|
| 3   |コメント投稿機能|投稿に対してコメントを送れるようにする| 投稿詳細ページにてコメントを送信できる |他人の投稿に対して自分の意見を発言する。 |3|
| 2   |検索機能|ユーザーが簡単に検索できるようにする| 複数条件を指定した上で見たい投稿の検索を可能にする |自分が見たいものを瞬時に見つける。 |3|
| 1  |音声検索機能|音声で検索できるようにする。| 音声検索ボタンを推し検索した内容を発言する |文字を打たずに検索できる |7|
| 2  |いいね機能|どのレビューが人気があるのかが分かる| 詳細ページにていいねボタンを押す |いいと思ったレビューにいいねを押す  |5|
| 2  |フォロー機能|お気に入りのユーザーの投稿を簡単に閲覧できるようにする| ユーザーページにてフォローを押す |自分がいいと思った人に対していつでもその人の投稿が見れるようになる |7|
| 1  |通知機能|ユーザーに対しての反応が分かるようにする| 通知一覧でコメントされた・フォローされた・いいねされたを瞬時に確認する |自分に対して他人が行ったことが瞬時に分かる|12|
| 2  |カテゴリー分け|カテゴリー別に簡単に探すことができるようにする| 投稿一覧のカテゴリーを押すとそれぞれのカテゴリーページに飛べる |カテゴリー別に投稿を見つけることができる|12|

## 7. 機能について
### ・投稿関連
#### レビュー投稿
![demo](https://gyazo.com/66ef504c79e03ab243ab011a35ebe156/raw)
#### レビュー一覧
[![Image from Gyazo](https://i.gyazo.com/189c4ad35b4744fa00f5e426c9e06960.png)](https://gyazo.com/189c4ad35b4744fa00f5e426c9e06960)
#### レビュー詳細表示
[![Image from Gyazo](https://i.gyazo.com/bfd5da617df366762accde1a6431f391.gif)](https://gyazo.com/bfd5da617df366762accde1a6431f391)
#### レビュー編集機能
[![Image from Gyazo](https://i.gyazo.com/eb5bc8fcdfd2add8f48ea51edcd3f647.gif)](https://gyazo.com/eb5bc8fcdfd2add8f48ea51edcd3f647)
#### レビューの削除
[![Image from Gyazo](https://i.gyazo.com/be41065867ae4232d85ed3a4a7a15da6.gif)](https://gyazo.com/be41065867ae4232d85ed3a4a7a15da6)
### ・コメントの投稿
[![Image from Gyazo](https://i.gyazo.com/9e494055f1411dfb23f056f05904b536.gif)](https://gyazo.com/9e494055f1411dfb23f056f05904b536)
### ・カテゴリーベージ
[![Image from Gyazo](https://i.gyazo.com/2bd3ba202081fc98551efb7b93ee8bbd.gif)](https://gyazo.com/2bd3ba202081fc98551efb7b93ee8bbd)
### ・いいね機能
[![Image from Gyazo](https://i.gyazo.com/8557b688ea102ae1795d07a82b326f74.gif)](https://gyazo.com/8557b688ea102ae1795d07a82b326f74)
### ・ランキング機能
#### レビューランキング
[![Image from Gyazo](https://i.gyazo.com/898185b1e31fb76fcc31f6766504ffcf.png)](https://gyazo.com/898185b1e31fb76fcc31f6766504ffcf)
#### アクセス数ランキング
[![Image from Gyazo](https://i.gyazo.com/4c2e57f9a6ecf91374ddcb5f99524c6b.png)](https://gyazo.com/4c2e57f9a6ecf91374ddcb5f99524c6b)
#### コメント数ランキング
[![Image from Gyazo](https://i.gyazo.com/e49605bff614ff1684a967fd7b189b1d.png)](https://gyazo.com/e49605bff614ff1684a967fd7b189b1d)
### ・検索機能
#### 文字検索
[![Image from Gyazo](https://i.gyazo.com/7fc33753c5e2f96e1e18996b7a6749c7.gif)](https://gyazo.com/7fc33753c5e2f96e1e18996b7a6749c7)
#### 音声検索
[![Image from Gyazo](https://i.gyazo.com/4fa65e788557091966229af3325ac1be.gif)](https://gyazo.com/4fa65e788557091966229af3325ac1be)
### ・ユーザー関連
#### ユーザー一覧
[![Image from Gyazo](https://i.gyazo.com/aa27814869296300f84bdb136c09c6f9.jpg)](https://gyazo.com/aa27814869296300f84bdb136c09c6f9)
#### ユーザーページ
[![Image from Gyazo](https://i.gyazo.com/37c08f4a02aa145096eaf309bedaecb2.jpg)](https://gyazo.com/37c08f4a02aa145096eaf309bedaecb2)
#### ユーザー編集ページ
[![Image from Gyazo](https://i.gyazo.com/de139116aef526a29e9c119acf097af8.jpg)](https://gyazo.com/de139116aef526a29e9c119acf097af8)
### ・アカウントのフォロー
[![Image from Gyazo](https://i.gyazo.com/f06d4a84208a359975bb580474f23050.gif)](https://gyazo.com/f06d4a84208a359975bb580474f23050)
### ・通知機能
[![Image from Gyazo](https://i.gyazo.com/da75a006f39366ac6a7620485198382b.png)](https://gyazo.com/da75a006f39366ac6a7620485198382b)

## 8.実装予定の機能
#### 

## 9.データーベース設計
[![Image from Gyazo](https://i.gyazo.com/efd9900a15d57c20c77f32a036ef3850.png)](https://gyazo.com/efd9900a15d57c20c77f32a036ef3850)

## 10.ローカルでの動作方法
### rubyのバージョン
#### 2.6.6p146
### railsのバージョン
#### 6.0.4

### 下記をterminal上で実行する
#### git clone　https://github.com/sugiryota/Review.git
#### cd Review
#### bundle install
#### yarn install







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