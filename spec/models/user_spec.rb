require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) { { username: 'User name', icon: 'user-icon' } }
  let(:invalid_attributes) { { username: 'Extremely long user same' } }

  describe 'Validations tests for User model' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect(
          User.new(valid_attributes)
        ).to be_valid
      end
    end

    context 'with invalid parameters' do
      it "doesn't create a new User" do
        expect(
          User.new(invalid_attributes)
        ).not_to be_valid
      end
    end
  end

  context 'Association tests for User model' do
    it 'should have many exercises' do
      u = User.reflect_on_association(:welfares)
      expect(u.macro).to eq(:has_many)
    end
    it 'should have many groups' do
      u = User.reflect_on_association(:groups)
      expect(u.macro).to eq(:has_many)
    end
  end
end

