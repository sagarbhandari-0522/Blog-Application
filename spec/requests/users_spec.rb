require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end
  describe 'GET /index' do
    it 'should get all the users' do
      get users_path
      expect(response).to render_template(:index)
    end
  end
  describe 'PATCH/update' do
    it 'should update users' do
      patch user_path(User.first), params: { user: { role_ids: [1] } }
    end
  end
end
