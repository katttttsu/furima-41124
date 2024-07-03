#テーブル設計

##usersテーブル##

| Colum                   | Type   | Options    |
| -----------------       | ------ | ---------- |
| nickname                | string | null:false |
| email                   | string | null:false, unique: true | 
| password                | string | null:false |
| first_name              | string | null:false |
| last_name               | string | null:false |
| first_name_kana         | string | null:false |
| last_name_kana          | string | null:false |
| profile                 | text   | null:false |
| birthday                | text   | null:false |
| image                   | text   | null:false |

### Association
-has_many :items
-has_many :comments
-belong_to :address
-belong_to :card

##itemsテーブル##
| Colum               | Type            | Options    |
| ----------          | ----------      | ---------- | 
| name                | string          | null:false |
| price               | integer         | null:false | 
| introduce           | text            | null:false |
| category            | references      | null:false, foreign_key: true |
| brand               | references      | null:false, foreign_key: true |
| condition           | string          | null:false | 
| size_id             | string          | null:false |
| shipping_area       | string          | null:false | 
| shipping_price      | integer         | null:false |
| shipping_date       | integer         | null:false |
| shipping_method     | string          | null:false |
| user_id             | references      | null:false, foreign_key: true |

### Association
-has_many :comments
-belongs_to :users
-belongs_to :categories
-belongs_to :brands



##commentsテーブル##
| Colum     | Type       | Options    |
| --------- | ---------- | ---------- |
| comment   | text       | null:false | 
| user_id   | references | null:false, foreign_key: true | 
| item_id   | references | null:false, foreign_key: true | 

### Association
-belongs_to :items
-belongs_to :users

##favarite_itemsテーブル##
| Colum     | Type       | Options    |
| --------- | ---------- | ---------- |
| user_id   | references | null:false, foreign_key: true | 
| item_id   | references | null:false, foreign_key: true | 

### Association
-belongs_to :items
-belongs_to :users
  


##addressテーブル##
| Colum            | Type            | Options    |
| ----------       | ----------      | ---------- | 
| postial_cord     | integer         | null:false |
| prefecture       | string          | null:false | 
| city             | string          | null:false |
| street           | string          | null:false |
| building         | string          | null:false |
| house_num        | integer         | null:false | 
| phone            | integer         | null:false |
| user_id          | references      | null:false, foreign_key: true |
| first_name       | string          | null:false |
| last_name        | string          | null:false |
| first_name_kana  | string          | null:false |
| last_name_kana   | text            | null:false |

### Association
-belongs_to :user

##cardテーブル##
| Colum     | Type       | Options    |
| --------- | ---------- | ---------- |
| user_id   | references | null:false, foreign_key: true | 
| card_id   | integer    | null:false | 

### Association
-belongs_to :user

##brandsテーブル##
| Colum     | Type       | Options    |
| --------- | ---------- | ---------- |
| name      | string     | null:false | 

### Association
-has_many :item

##categoryテーブル##
| Colum      | Type       | Options    |
| ---------  | ---------- | ---------- |
| name       | string     | null:false |  

### Association
-has_many :item

##item_imageテーブル##
| Colum      | Type       | Options    |
| ---------  | ---------- | ---------- |
| item_id    | references | null:false, foreign_key: true | 
| image      | text      | null:false  | 

### Association
-belongs_to :item
