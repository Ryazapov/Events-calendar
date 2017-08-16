feature "Check Event" do
  include_context "current user signed in"
  let(:event) { create :event, :once, user: user, title: "once", date: "10/03/2017" }

  scenario "User check date with event", js: true do
    visit root_path(start_date: "2017-03-01")

    find(:xpath, "//td[@data-open='2017-03-10']").click
    visible_modal = find(:xpath, "//*[@id='2017-03-10']")
    
    expect(visible_modal).to have_content("once")
    expect(visible_modal).to have_content("10/03/2017")
  end
end
