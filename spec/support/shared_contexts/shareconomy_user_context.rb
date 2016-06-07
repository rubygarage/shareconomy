RSpec.shared_context 'shareconomy_user' do
  let(:user) { create(:shareconomy_user) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:shareconomy_user]
  end

  before do
    allow(@controller).to receive(:current_shareconomy_user).and_return(user)
  end
end
