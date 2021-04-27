require 'rails_helper'

RSpec.describe 'groups/new', type: :feature do
  it 'renders new group form' do
    visit new_group_url
    expect(:name).to match(/name/)
  end
end
