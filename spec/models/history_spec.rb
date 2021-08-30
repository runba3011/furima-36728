require 'rails_helper'

RSpec.describe History, type: :model do
  before do
    @history = FactoryBot.build(:history)
    @address = FactoryBot.build(:address)
    @history.address = @address
  end

  describe '購入履歴の保存ができるとき' do
    it 'user,itemに紐づいており、かつaddressテーブルの情報を持っているとき' do
      expect
    end
  end

  describe '購入履歴の保存ができないとき' do
  end
end
