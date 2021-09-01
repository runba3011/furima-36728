require 'rails_helper'

RSpec.describe History, type: :model do
  before do
    @history = FactoryBot.build(:history)
    @address = FactoryBot.build(:address)
    @history.address = @address
  end

  describe '購入履歴の保存ができるとき' do
    it 'user,itemに紐づいており、かつaddressテーブルの情報を持っているとき' do
      expect(@history).to be_valid
    end
  end

  describe '購入履歴の保存ができないとき' do
    it 'Usersテーブルと紐づいていないとき' do
      @history.user = nil;
      @history.valid?
      expect(@history.errors.full_messages).to include("User can't be blank")
    end

    it 'Itemsテーブルと紐づいていないとき' do
      @history.item = nil;
      @history.valid?
      expect(@history.errors.full_messages).to include("Item can't be blank")
    end

    it 'Addressesテーブルと紐づいていないとき' do
      @history.address = nil;
      @history.valid?
      expect(@history.errors.full_messages).to include("Address can't be blank")
    end
  end
end
