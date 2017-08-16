feature "Edit Event" do
  delegate :form, to: :event_edit_page

  context "when current user signed in" do
    include_context "current user signed in"

    let(:another_user) { create :user }

    let(:event) { create :event, user: user }
    let(:another_event) { create :event, user: another_user }

    scenario "user can edit own event" do
      visit event_path(event)

      click_on "edit"

      form.title.set "Updated title"
      form.description.set "Updated description"

      click_on "Edit"

      expect(page).to have_content("Updated title")
      expect(page).to have_content("Updated description")
    end

    scenario "user cannot edit another user's event" do
      visit event_path(another_event)
      expect(page).to have_no_content("Edit")

      visit edit_event_path(another_event)
      expect(page).to have_content("Перейти к главной странице")
    end
  end

  context "when current user not signed in" do
    let(:event) { create :event }

    scenario "user cannot edit event" do
      visit event_path(event)
      expect(page).to have_no_content("edit")

      visit edit_event_path(event)
      expect(page).to have_content("Log in")
    end
  end

  def event_edit_page
    @event_edit_page = EventPage::Edit.new
  end
end
