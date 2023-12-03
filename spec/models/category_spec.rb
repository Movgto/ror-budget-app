require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { TestAssetBuilder.user }
  it 'valid category' do
    category = Category.new(user:, name: 'Restaurant')
    expect(category).to be_valid
  end

  it 'validates name presence' do
    category = Category.new(user:, name: '')
    expect(category).to_not be_valid
  end
end
