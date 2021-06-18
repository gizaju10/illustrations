require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe '各モデルとのアソシエーション' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userモデルとのアソシエーション' do
      let(:target) { :user }

      it 'Userとの関連付けはbelongs_toであること' do
        expect(association.macro).to  eq :belongs_to
      end
    end
  end
end
