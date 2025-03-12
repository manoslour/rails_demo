require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe 'GET / (public)' do
    let!(:post) { create(:post, status: :published)}
    let!(:post_draft) { create(:post)}

    it "assigns published posts" do
      get '/'
      expect(assigns(:posts)).to match_array([post])
    end
  end

  context 'User authorized' do
    include_context 'logged in user'

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
        let(:user) { create(:user) }

        let!(:post) { create(:post, status: :draft, user: user) } # from ruby version 3.1+ user can be ommited

        it 'assigns no posts' do
          get '/posts'
          expect(assigns(:posts)).to be_empty
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
