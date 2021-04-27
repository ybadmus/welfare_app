require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(username: 'Group Owenr', icon: 'user-icon') }
  let(:valid_attributes) { { name: 'Group Name', icon: 'group-icon' } }
  let(:invalid_attributes) { { name: '', icon: '' } }

  describe 'Validations tests for Group model' do
    context 'with valid parameters' do
      it 'creates a new Group' do
        expect(
          user.groups.new(valid_attributes)
        ).to be_valid
      end
    end

    context 'with invalid parameters' do
      it "doesn't create a new Group" do
        expect(
          user.groups.new(invalid_attributes)
        ).not_to be_valid
      end
    end
  end

  context 'Association tests for Group model' do
    it 'should belong to user' do
      g = Group.reflect_on_association(:user)
      expect(g.macro).to eq(:belongs_to)
    end
    it 'should have many welfares' do
      g = Group.reflect_on_association(:welfares)
      expect(g.macro).to eq(:has_many)
    end
    it 'should have many categories' do
      g = Group.reflect_on_association(:categories)
      expect(g.macro).to eq(:has_many)
    end
  end
end
