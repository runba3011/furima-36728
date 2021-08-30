require 'rails_helper'

RSpec.describe History, type: :model do
  before do
    @history = FactoryBot.build(:history)
  end

  describe '購入履歴の保存ができるとき' do
    it 'user,itemに紐づいており、かつaddressテーブルの情報を持っているとき' do
      binding.pry
    end
  end

  describe '購入履歴の保存ができないとき' do
  end
end
