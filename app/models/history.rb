class History < ApplicationRecord
  # history_address.rbで保存するようにする前についていたバリデーションになります。
  # テストコードを使用するときのみ一時的にコメントアウトをはずすようにしてありますので残しておくようよろしくお願いします。
  # with_options presence: true do
  #   validates :user
  #   validates :item
  #   validates :address
  # end
  
  belongs_to :user
  belongs_to :item
  has_one :address
end
