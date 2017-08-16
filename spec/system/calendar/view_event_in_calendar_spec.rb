feature "View Event", js: true do
  delegate :calendar, :modal, to: :calendar_page

  include_context "current user signed in"

  let!(:event) { create :event, :once, user: user, title: "once", date: "10/03/2017" }

  scenario "User sees event in calendar" do
    visit root_path(start_date: "2017-03-01")

    calendar.days(text: "10").first.click

    expect(modal).to have_content("once")
    expect(modal).to have_content("10/03/2017")
  end

  def calendar_page
    @calendar_page = CalendarPage::Index.new
  end
end
