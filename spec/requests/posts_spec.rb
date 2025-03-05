require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "returns a success response" do
      get '/posts'
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /posts" do
    before do
      User.create(username: 'Demo', password: '123456')
    end

    it "returns a success response" do
      post '/posts', params: { post: { title: 'Ok', content: 'Alright'} }
      expect(response).to have_http_status(:found)
    end
  end
end
