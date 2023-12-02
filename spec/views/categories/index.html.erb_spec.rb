require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  let(:user) { TestAssetBuilder.user }
  let(:category) { Category.new(user: user, name: 'A store') }

  before do
    category.save
    assign(:user, user)
    assign(:categories, user.categories)
    render
  end

  it 'renders category name' do
    expect(rendered).to match(/#{category.name}/)
  end

  it 'renders category total' do
    expect(rendered).to match(/#{category.total}/)
  end

  it 'renders button to add new category' do
    expect(rendered).to have_selector('a.add-button', text: 'Add new category')
  end
end