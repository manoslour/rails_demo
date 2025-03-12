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
    let(:current_user) { create(:user) }

    before do
      login_as(current_user, scope: :user)
    end

    describe "GET /index" do
      it "returns a success response" do
        get '/posts'
        expect(response).to have_http_status(:ok)
      end

      context 'when draft post' do
        let!(:post) { create(:post, user: current_user) }

        it 'assigns draft posts' do
          get '/posts'
          expect(assigns(:posts)).to match_array([post])
        end
      end

      context 'when published post' do
        let!(:post) { create(:post, status: :published, user: current_user) }

        it 'assigns published posts' do
          get '/posts'
          expect(assigns(:posts)).to match_array([post])
        end
      end

      context 'when other users post' do
        let(:other_other) { create(:user) }

        let!(:post) { create(:post, status: :draft, user: other_other ) }

        it 'assigns published posts' do
          get '/posts'
          expect(assigns(:posts)).to match_array([])
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
