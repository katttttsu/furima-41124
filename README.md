#テーブル設計

##usersテーブル##
| Colum                   | Type   | Options    |
| ----------------------- | ------ | ---------- |
| nickname                | string | null:false |
| email                   | string | null:false, unique: true | 
| password                | string | null:false |
| password_confirmation   | string | null:false |
| first_name              | string | null:false |
| last_name               | string | null:false |
| first_name_kana         | string | null:false |
| last_name_kana          | string | null:false |
| birthday                | text   | null:false |


### Association
-has_many :items
-belongs_to :address


##itemsテーブル##
| Colum               | Type            | Options    |
| ------------------- | --------------- | ---------- | 
| image               | string          | null:false |
| item_name           | string          | null:false |
| explanation         | text            | null:false |
| category            | references      | null:false |
| condition           | string          | null:false | 
| shipping_charges    | string          | null:false |
| shipping_area       | string          | null:false | 
| shipping_date       | integer         | null:false |
| price               | integer         | null:false | 
| sales commission    | integer         | null:false |
| sales profit        | integer         | null:false |

### Association
-belongs_to :users
-belongs_to :Purchase history


##addressテーブル##
| Colum            | Type       | Options    |
| ---------------- | ---------- | ---------- | 
| postial_cord     | integer    | null:false |
| prefecture       | string     | null:false | 
| city             | string     | null:false |
| street           | string     | null:false |
| building         | string     | null:false |
| phone            | integer    | null:false |

### Association
-belongs_to :user

##Purchase historyテーブル##
| Colum             | Type        | Options    |
| ----------------- | ----------  | ---------- |
| item_name         | references  | null:false | 
| price             | references  | null:false | 
| seller_name       | string      | null:false |
| category          | references  | null:false |
| condition         | references  | null:false | 
| shipping_charges  | references  | null:false |
| shipping_area     | references  | null:false |
| shipping_date     | references  | null:false |  
| comment           | text       | null:false |

### Association
-belongs_to :item
