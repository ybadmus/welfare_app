require 'rails_helper'

RSpec.describe Welfare, type: :model do
  let(:user) { User.create(username: 'Welfare creator', icon: 'user-icon') }
  let(:valid_attributes) { { name: 'Welfare Name', remark: 'Good contributor', contributor_no: 'GD5670', amount: 2 } }
  let(:invalid_attributes) { { name: '', remark: '', contributor_no: '', amount: 2  } }

  describe 'Validations tests for Welfare model' do
    context 'with valid parameters' do
      it 'creates a new Welfare' do
        expect(
          user.welfares.new(valid_attributes)
        ).to be_valid
      end
    end

    context 'with invalid parameters' do
      it "doesn't create a new Welfare" do
        expect(
          user.welfares.new(invalid_attributes)
        ).not_to be_valid
      end
    end
  end

  context 'Association tests for Welfare model' do
    it 'should belong to user' do
      e = Welfare.reflect_on_association(:user)
      expect(e.macro).to eq(:belongs_to)
    end
    it 'should have many groups' do
      e = Welfare.reflect_on_association(:groups)
      expect(e.macro).to eq(:has_many)
    end
    it 'should have many categories' do
      e = Welfare.reflect_on_association(:categories)
      expect(e.macro).to eq(:has_many)
    end
  end
end