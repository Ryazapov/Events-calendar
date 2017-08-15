describe EventsController do
  describe "DELETE destroy" do
    let(:user) { create :user }
    let(:event) { create :event, user: user }

    before do
      sign_in user
    end

    it "destroys event" do
      delete :destroy, params: { id: event.id }

      expect(response.status).to eq 302
    end

    context "when user tries to delete another user's event" do
      let(:another_user) { create :user }
      let(:another_event) { create :event, user: another_user }

      it "cannot delete event" do
        delete :destroy, params: { id: another_event.id }

        expect(response.status).to eq 403
      end
    end
  end
end
