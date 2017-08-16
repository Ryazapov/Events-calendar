feature "Create Event" do
  delegate :form, to: :event_new_page

  context "when current user signed in" do
    include_context "current user signed in"

    let(:event_attributes) { attributes_for(:event) }

    scenario "user can create event" do
      visit new_event_path

      form.title.set event_attributes[:title]
      form.date.set event_attributes[:date]
      form.event_type.set event_attributes[:event_type]
      form.description.set event_attributes[:description]

      click_on "Create"

      expect(page).to have_content(event_attributes[:title])
      expect(page).to have_content(event_attributes[:description])
    end
  end

  context "when current user not signed in" do
    scenario "user cannot create event" do
      visit new_event_path

      expect(page).to have_content("Log in")
    end
  end

  def event_new_page
    @event_new_page = EventPage::New.new
  end
end
