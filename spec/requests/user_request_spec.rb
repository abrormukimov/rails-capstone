require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/sign_up' do
    it 'should render signup form successfully' do
      get '/users/sign_up'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /users/sign_in' do
    it 'should render login form successfully' do
      get '/users/sign_in'
      expect(response).to have_http_status(:success)
    end
  end
end
