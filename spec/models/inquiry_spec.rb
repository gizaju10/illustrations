require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  let(:inquiry) { create(:inquiry) }
  describe '#create' do
    context '保存できる場合' do
      it "全てのパラメーターが揃っていれば保存できる" do
        expect(inquiry).to be_valid
      end

      # it "inquiryが1文字以上なら保存できる" do
      #   inquiry.inquiry = "A" * 1
      #   expect(inquiry).to be_valid
      # end

      # it "inquiryが1,000文字以内なら保存できる" do
      #   inquiry.inquiry = "A" * 1000
      #   expect(inquiry).to be_valid
      # end
    end

    context "保存できない場合" do
      it "nameがnilの場合は保存できない" do
        inquiry.name = nil
        inquiry.valid?
        expect(inquiry.errors[:name]).to include("を入力してください。")
      end

      it "emailがnilの場合は保存できない" do
        inquiry.email = nil
        inquiry.valid?
        expect(inquiry.errors[:email]).to include("を入力してください。")
      end

      it "messageがnilの場合は保存できない" do
        inquiry.message = nil
        inquiry.valid?
        expect(inquiry.errors[:message]).to include("を入力してください。")
      end

      # it "inquiryが1001文字以上の場合は保存できない" do
      #   inquiry.inquiry = "A" * 1001
      #   inquiry.valid?
      #   expect(inquiry.errors[:inquiry]).to include("は1000文字以内で入力してください")
      # end
    end
  end
end
