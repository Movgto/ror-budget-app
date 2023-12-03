require 'rails_helper'

RSpec.describe Operation, type: :model do
  let(:user) { TestAssetBuilder.user }

  it 'valid operation' do
    op = Operation.new(user:, name: 'name', amount: 3)
    expect(op).to be_valid
  end

  it 'validates name presence' do
    op = Operation.new(user:, name: '', amount: 3)
    expect(op).to_not be_valid
  end

  it 'validates amount presence' do
    op = Operation.new(user:, name: 'name')
    expect(op).to_not be_valid
  end
end
