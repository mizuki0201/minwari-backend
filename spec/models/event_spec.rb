require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe 'イベント新規作成' do
    context '正常系' do
      it '全ての情報が入力されていれば登録ができること' do
        expect(@event).to be_valid
      end
      
      it 'イベント詳細がなくても登録ができること' do
        @event.description = ''
        expect(@event).to be_valid
      end
    end

    context '異常系' do
      it 'イベント名がないと登録できないこと' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end
      
      it 'イベント名が50文字より多いと登録できないこと' do
        @event.title = 'あ' * 51
        @event.valid?
        expect(@event.errors.full_messages).to include("Title is too long (maximum is 50 characters)")
      end
      
      it 'イベント詳細が100文字より多いと登録できないこと' do
        @event.description = 'あ' * 101
        @event.valid?
        expect(@event.errors.full_messages).to include("Description is too long (maximum is 100 characters)")
      end
    end
  end
end
