class BaseSection < SitePrism::Section
  include PageHelpers
  include RSpec::Matchers

  def page
    @root_element || Capybara.current_session
  end

  private

  # This is to address a bug introduced by including
  # RSpec::Matchers to SitePrism::Page and SitePrism::Section
  #
  # See SitePrism issue #95 and #102
  def find_all(*find_args)
    page.all(*find_args)
  end
end
