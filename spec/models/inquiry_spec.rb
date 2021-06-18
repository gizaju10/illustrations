require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  let(:inquiry) { create(:inquiry) }
  describe '#create' do
    context '保存できる' do
      it '全てのパラメーターが揃っている場合' do
        expect(inquiry).to be_valid
      end
    end

    context '送信できない' do
      it 'nameが空の場合' do
        inquiry.name = nil
        inquiry.valid?
        expect(inquiry.errors[:name]).to include('を入力してください。')
      end

      it 'emailが空の場合' do
        inquiry.email = nil
        inquiry.valid?
        expect(inquiry.errors[:email]).to include('を入力してください。')
      end

      it 'message空の場合' do
        inquiry.message = nil
        inquiry.valid?
        expect(inquiry.errors[:message]).to include('を入力してください。')
      end

      it 'messageが1001文字の場合' do
        inquiry = build(:inquiry, message: 'a' * 1001)
        inquiry.valid?
        expect(inquiry.errors).to be_added(:message, :too_long, count: 1000)
      end
    end
  end
end
