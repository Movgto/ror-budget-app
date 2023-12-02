require 'rails_helper'

RSpec.describe "Operations", type: :request do
  let(:user) { TestAssetBuilder.user }
  let(:category) { Category.create(user: user, name: 'A store') }
  let(:operation) { Operation.create(user: user, name: 'TV 40', amount: 100) }
  let(:operation_category) { CategoryOperation.new(category: category, operation: operation) }

  describe 'GET operations#index' do
    before do
      sign_in user
      operation_category.save
      get "/categories/#{category.id}/operations"
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template operations/index' do
      expect(response).to render_template('operations/index')
    end

    it 'Body should include the operation name' do
      puts 'Operations:', category.operations
      expect(response.body).to match(/TV 40/)
    end
  end

  describe 'GET operations#new' do
    before do
      sign_in user
      get "/categories/#{category.id}/operations/new"
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template recipe/new' do
      expect(response).to render_template('operations/new')
    end
  end
end
