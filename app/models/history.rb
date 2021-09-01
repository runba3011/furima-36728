class History < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :item
    validates :address
  end
  
  belongs_to :user
  belongs_to :item
  has_one :address , dependent: :destroy
end
