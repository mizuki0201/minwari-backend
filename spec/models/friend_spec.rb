require 'rails_helper'

RSpec.describe Friend, type: :model do
  before do
    @friend = FactoryBot.build(:friend)
  end

  describe '友達新規追加' do
    context '正常系' do
      it '全てのデータが存在すれば新規友達追加ができること' do
        expect(@friend).to be_valid
      end
    end

    context '異常系' do
      it 'from_id（申請するユーザー）のデータが存在しないと登録できないこと' do
        @friend.from = nil
        @friend.valid?
        expect(@friend.errors.full_messages).to include("From must exist")
      end
      
      it 'to_id（申請されるユーザー）のデータが存在しないと登録できないこと' do
        @friend.to = nil
        @friend.valid?
        expect(@friend.errors.full_messages).to include("To must exist")
      end
    end
  end
end
