module PageHelpers
  {
    "event_edit_page" => "EventPage::Edit",
    "event_new_page" => "EventPage::New"
  }.each do |page_name, klass|
    define_method(page_name) do
      var_name = "@_#{page_name}"

      instance_variable_get(var_name) || instance_variable_set(var_name, klass.constantize.new)
    end
  end
end
