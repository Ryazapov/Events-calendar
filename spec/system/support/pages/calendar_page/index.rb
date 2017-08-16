module CalendarPage
  class Index < SitePrism::Page
    set_url_matcher %r{http:\/\/.+\..{2}:\d{5}\/}

    section :calendar, ".simple-calendar" do
      elements :days, ".day"
    end

    element :modal, ".reveal[aria-hidden='false']"
  end
end
