class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name           , presence: true
  validates :explain        , presence: true , length:{maximum: 40}
  validates :category_id    , presence: true , numericality:{other_than: 0}
  validates :status_id      , presence: true , numericality:{other_than: 0}
  validates :send_cost_id   , presence: true , numericality:{other_than: 0}
  validates :prefecture_id  , presence: true , numericality:{other_than: 0}
  validates :send_limit_id  , presence: true , numericality:{other_than: 0}
  validates :price          , presence: true
  validates :user           , presence: true
  has_one_attached :image   , presence: true

  belongs_to :user
  
  belongs_to :category #
  belongs_to :status #
  belongs_to :send_cost#
  belongs_to :prefecture#
  belongs_to :send_limit 

end
