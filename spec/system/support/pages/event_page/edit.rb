module EventPage
  class Edit < BasePage
    set_url_matcher %r{http:\/\/.+\..{2}:\d{5}\/events\/\d+\/edit}

    section :form, ".simple_form" do
      element :title, "#event_title"
      element :date, "#event_date"
      element :event_type, "#event_event_type"
      element :description, "#event_description"
    end
  end
end
