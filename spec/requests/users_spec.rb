require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET users#show" do
    xit "rescues from active record 404" do
      get '/users', params: { id: 1 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
