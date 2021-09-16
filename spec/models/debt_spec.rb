require 'rails_helper'

# そもそもフォームオブジェクトで一緒にテストすべき？
RSpec.describe Debt, type: :model do
  before do
    @debt = FactoryBot.build("debt")
  end

  describe '借金新規登録' do
    context '正常系' do
      it '全ての情報があれば登録ができること' do
        expect(@debt).to be_valid
      end
    end

    context '異常系' do
      it '借金額がないと登録できないこと' do
        @debt.price = nil
        @debt.valid?
        expect(@debt.errors.full_messages).to include("Price is not a number")
      end

      it '借金額が数字でないと登録できないこと' do
        @debt.price = 'テスト'
        @debt.valid?
        expect(@debt.errors.full_messages).to include("Price is not a number")
      end

      it '支払った側（from_id）がないと登録できないこと' do
        @debt.from_id = ''
        @debt.valid?
        expect(@debt.errors.full_messages).to include("From must exist")
      end

      it '支払う側（to_id）がないと登録できないこと' do
        @debt.to_id = ''
        @debt.valid?
        expect(@debt.errors.full_messages).to include("To must exist")
      end

      it '紐づくグループ情報がないと登録できないこと' do
        @debt.group = nil
        @debt.valid?
        expect(@debt.errors.full_messages).to include("Group must exist")
      end

      it '紐づくイベント情報がないと登録できないこと' do
        @debt.event = nil
        @debt.valid?
        expect(@debt.errors.full_messages).to include("Event must exist")
      end

      it '紐づく支出情報がないと登録できないこと' do
        @debt.expence = nil
        @debt.valid?
        expect(@debt.errors.full_messages).to include("Expence must exist")
      end
    end
  end
end
