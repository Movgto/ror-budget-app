require 'rails_helper'

RSpec.describe 'operations/index', type: :view do
  let(:user) { TestAssetBuilder.user }
  let(:category) { Category.new(user:, name: 'A store') }
  let(:operation) { Operation.new(user:, name: 'TV 40', amount: 100) }
  let(:operation_category) { CategoryOperation.new(category:, operation:) }

  before do
    category.save
    operation.save
    operation_category.save
    assign(:user, user)
    assign(:category, category)
    assign(:operations, category.operations)

    render
  end

  it 'renders operation name' do
    expect(rendered).to match(/#{operation.name}/)
  end

  it 'renders operation amount' do
    expect(rendered).to match(/#{operation.amount}/)
  end

  it 'renders button to add new operation' do
    expect(rendered).to have_selector('a.add-button', text: 'Add new transaction')
  end
end
