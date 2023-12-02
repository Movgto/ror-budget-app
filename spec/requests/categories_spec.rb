require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) { TestAssetBuilder.user }
  describe 'GET categories#index' do
    before do
      sign_in user
      get '/categories'
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template recipe/index' do
      expect(response).to render_template('categories/index')
    end

    it 'Body should include categories title' do
      expect(response.body).to match(/CATEGORIES/)
    end
  end

  describe 'GET categories#new' do
    before do
      sign_in user
      get '/categories/new'
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template recipe/new' do
      expect(response).to render_template('categories/new')
    end
  end
end
