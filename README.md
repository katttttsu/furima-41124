#テーブル設計

##usersテーブル##
| Colum                   | Type   | Options    |
| ----------------------- | ------ | ---------- |
| nickname                | string | null:false |
| email                   | string | null:false, unique: true | 
| encrypted_password      | string | null:false |
| first_name              | string | null:false |
| last_name               | string | null:false |
| first_name_kana         | string | null:false |
| last_name_kana          | string | null:false |
| birthday                | date   | null:false |


### Association
-has_many :items
-has_many :Purchase_histories


##itemsテーブル##
| Colum               | Type            | Options    |
| ------------------- | --------------- | ---------- | 
| item_name           | string          | null:false |
| explanation         | text            | null:false |
| category_id         | integer         | null:false |
| condition_id        | integer         | null:false | 
| shipping_charge_id  | integer         | null:false |
| prefecture_id       | integer         | null:false | 
| shipping_date_id    | integer         | null:false |
| price               | integer         | null:false |
| user                | references       | null:false, foreign_key: true |

### Association
-belongs_to :user
-has_one :Purchase_history


##addressテーブル##
| Colum                | Type       | Options    |
| -------------------- | ---------- | ---------- | 
| postal_cord          | string     | null:false |
| prefecture_id        | integer    | null:false | 
| city                 | string     | null:false |
| street               | string     | null:false |
| building             | string     |            |
| phone                | string     | null:false |
| purchase_history     | references | null:false, foreign_key: true |

### Association
-belongs_to :purchase_history

##Purchase_historyテーブル##
| Colum          | Type         | Options    |
| -------------- | ------------ | ---------- |
| user           | references   | null:false, foreign_key: true |
| item           | references   | null:false, foreign_key: true |
### Association
-belongs_to :item
-belongs_to :user
-has_one :address
