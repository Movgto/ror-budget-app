require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { TestAssetBuilder.user }

  it 'valid user' do
    expect(user).to be_valid
  end

  it 'validates presence of user name' do
    user = User.new(name: '', email: 'example', password: 'password', confirmed_at: Time.now)
    expect(user).to_not be_valid
  end

  it 'validates presence of user email' do
    user = User.new(name: 'Jimmy', email: '', password: 'password', confirmed_at: Time.now)
    expect(user).to_not be_valid
  end

  it 'validates presence of user password' do
    user = User.new(name: 'Jimmy', email: 'example', password: '', confirmed_at: Time.now)
    expect(user).to_not be_valid
  end
end