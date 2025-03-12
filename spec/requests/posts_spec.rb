require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe 'GET /' do
    let!(:post) { create(:post, status: :published)}

    it "returns a success response" do
      get '/'
      expect(assigns(:posts)).to match_array([post])
    end
  end

  context 'User authorized' do

    before do
      login_as(create(:user), scope: :user)
    end

    describe "GET /index" do
      it "returns a success response" do
        get '/posts'
        expect(response).to have_http_status(:ok)
      end

      context 'when draft post' do
        let!(:post) { create(:post) }

        it 'assigns draft posts' do
          get '/posts'
          expect(assigns(:posts)).to match_array([post])
        end
      end

      context 'when published post' do
        let!(:post) { create(:post, status: :published  ) }

        it 'assigns published posts' do
          get '/posts'
          expect(assigns(:posts)).to match_array([post])
        end
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
end
