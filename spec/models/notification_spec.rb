require 'rails_helper'
describe Notification do
  describe 'アソシエーション' do
    let(:association) do
       described_class.reflect_on_association(target)
    end

    context 'User（visitor）モデルとの関係' do
      let(:target) { :visitor }
      it 'User（visitor）との関連付けはbelongs_toであること' do
        expect(association.macro).to eq :belongs_to
      end
      it '結合するモデルのクラス：User' do
        expect(association.class_name).to eq 'User'
      end
    end

    context 'User（visited）モデルとの関係' do
      let(:target) { :visited }
      it 'User（visited）との関連付けはbelongs_toであること' do
        expect(association.macro).to eq :belongs_to
      end
      it '結合するモデルのクラス：User' do
        expect(association.class_name).to eq 'User'
      end
    end

    context 'Postモデルとの関係' do
      let(:target) { :post }
      it 'Postとの関連付けはbelongs_toであること' do
        expect(association.macro).to eq :belongs_to
      end
      it '結合するモデルのクラス名：Post' do
        expect(association.class_name).to eq 'Post'
      end
    end

    context 'Commentモデルとの関係' do
      let(:target) { :comment }
      it 'Commentとの関連付けはbelongs_toであること' do
        expect(association.macro).to eq :belongs_to
      end
      it '結合するモデルのクラス名：Comment' do
        expect(association.class_name).to eq 'Comment'
      end
    end
  end
end