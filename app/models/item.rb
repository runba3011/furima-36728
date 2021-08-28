class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name           , presence: true , length:{maximum: 40}
  validates :explain        , presence: true , length:{maximum: 1000}
  validates :category_id    , presence: true , numericality:{other_than: 0, message: "can't be blank"}
  validates :status_id      , presence: true , numericality:{other_than: 0, message: "can't be blank"}
  validates :send_cost_id   , presence: true , numericality:{other_than: 0, message: "can't be blank"}
  validates :prefecture_id  , presence: true , numericality:{other_than: 0, message: "can't be blank"}
  validates :send_limit_id  , presence: true , numericality:{other_than: 0, message: "can't be blank"}
  validates :price          , presence: true , numericality:{only_integer: true , greater_than_or_equal_to: 300, less_than_or_equal_to:9999999}
  validates :user           , presence: true

  has_one_attached :image   
  validates :image , presence: true

  belongs_to :user
  
  belongs_to :category 
  belongs_to :status 
  belongs_to :send_cost
  belongs_to :prefecture
  belongs_to :send_limit 

end
