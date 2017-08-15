feature "Delete Event" do
  context "when current user signed in" do
    include_context "current user signed in"

    let(:another_user) { create :user }

    let(:event) { create :event, user: user }
    let(:another_event) { create :event, user: another_user }

    scenario "user can delete own event" do
      visit edit_event_path(event)

      click_on "Delete"

      expect(page).to have_no_content(event.title)
    end
  end
end
