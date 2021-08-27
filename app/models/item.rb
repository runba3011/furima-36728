class Item < ApplicationRecord
  validates :name           , presence: true
  validates :explain        , presence: true , length:{maximum: 40}
  validates :category_id    , presence: true
  validates :status_id      , presence: true
  validates :send_cost_id   , presence: true
  validates :prefecture_id  , presence: true
  validates :send_limit_id  , presence: true
  validates :price          , presence: true
  validates :user           , presence: true
  has_one_attached :image   , presence: true

  belongs_to :user
end
