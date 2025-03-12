
RSpec.shared_context 'logged in user' do
  let(:current_user) { create(:user) }

  before do
    login_as(current_user, scope: :user)
  end
end
