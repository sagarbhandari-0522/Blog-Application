require 'rails_helper'
current_user = User.first
RSpec.describe User, type: :model do
  it 'email presence' do
    user = User.new(email: nil, password: 'password')
    expect(user).to_not be_valid
    user.email = 'abcd@gmail.com'
    expect(user).to be_valid
  end
  it 'password presence' do
    user = User.new(email: 'sagarvandari@gmail.com', password: nil)
    expect(user).to_not be_valid
    user.password = 'password'
    expect(user).to be_valid
  end
  it 'email uniqueness' do
    user = User.new(email: current_user.email, password: 'Password')
    expect(user).to_not be_valid
    user.email = 'sandhesh@gmail.com'
    expect(user).to be_valid
  end
end
