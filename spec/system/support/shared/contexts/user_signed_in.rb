shared_context "current user signed in" do
  let(:user) { create :user }

  background do
    login_as user
  end
end
