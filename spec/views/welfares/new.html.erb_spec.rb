require 'rails_helper'

RSpec.describe 'welfares/new', type: :view do
  before(:each) do
    assign(:welfare, Welfare.new(
                       authorId: 1,
                       name: 'MyString',
                       amount: 2,
                       remark: 'Good contributor',
                       contributor_no: 'D896573'
                     ))
  end

  it 'renders new welfare form' do
    initialize_values

    render

    assert_select 'form[action=?][method=?]', welfares_path, 'post' do

      assert_select 'input[name=?]', 'welfare[contributor_no]'

      assert_select 'input[name=?]', 'welfare[name]'

      assert_select 'input[name=?]', 'welfare[amount]'
    end
  end
end

def initialize_values
  @groups = [['Select group', '']]
  Group.all.each { |item| @groups << [item.name, item.id] }
end

