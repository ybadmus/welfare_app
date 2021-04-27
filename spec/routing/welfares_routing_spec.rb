require 'rails_helper'

RSpec.describe WelfaresController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/welfares').to route_to('welfares#index')
    end

    it 'routes to #new' do
      expect(get: '/welfares/new').to route_to('welfares#new')
    end

    it 'routes to #create' do
      expect(post: '/welfares').to route_to('welfares#create')
    end
  end
end
