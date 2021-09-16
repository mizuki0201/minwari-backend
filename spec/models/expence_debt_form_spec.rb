require 'rails_helper'

RSpec.describe ExpenceDebtForm, type: :model do
  before do
    @expence_debt_form = FactoryBot.build(:expence_debt_form)
  end

  describe '支出新規記録' do
    context '正常系' do
      it '全てのデータを入力すれば登録ができる' do
        expect(@expence_debt_form).to be_valid
      end

      it '支出詳細がなくても登録ができること' do
        @expence_debt_form.description = ''
        expect(@expence_debt_form).to be_valid
      end
    end

    context '異常系' do
      it '支出名がないと登録できないこと' do
        @expence_debt_form.title = ''
        @expence_debt_form.valid?
        expect(@expence_debt_form.errors.full_messages).to include("Title can't be blank")
      end

      it '支出額がないと登録できないこと' do
        @expence_debt_form.price = nil
        @expence_debt_form.valid?
        expect(@expence_debt_form.errors.full_messages).to include("Price is not a number")
      end

      it '支出額が数字でないと登録できない' do
        @expence_debt_form.price = 'テスト'
        @expence_debt_form.valid?
        expect(@expence_debt_form.errors.full_messages).to include("Price is not a number")
      end

      it '紐づくイベント情報がないと登録できないこと' do
        @expence_debt_form.event_id = ''
        @expence_debt_form.valid?
        expect(@expence_debt_form.errors.full_messages).to include("Event can't be blank")
      end

      it '紐づくグループ情報がないと登録できないこと' do
        @expence_debt_form.group_id = ''
        @expence_debt_form.valid?
        expect(@expence_debt_form.errors.full_messages).to include("Group can't be blank")
      end

      it '支出者情報がないと登録できないこと' do
        @expence_debt_form.user_id = ''
        @expence_debt_form.valid?
        expect(@expence_debt_form.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
