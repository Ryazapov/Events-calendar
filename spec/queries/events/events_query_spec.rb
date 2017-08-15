describe Events::EventsQuery do
  subject(:query) { described_class.new(current_month) }

  let!(:current_month_start_date) { "01/02/2017".to_date }
  let(:current_month) { (current_month_start_date..current_month_start_date.end_of_month) }

  let!(:once_event_previous_month) { create :event, :once, date: "01/01/2017" }
  let!(:once_event_current_month) { create :event, :once, date: "01/02/2017" }
  let!(:once_event_next_month) { create :event, :once, date: "01/03/2017" }

  let!(:daily_event_previous_month) { create :event, :daily, date: "01/01/2017" }
  let!(:daily_event_current_month) { create :event, :daily, date: "01/02/2017" }
  let!(:daily_event_next_month) { create :event, :daily, date: "01/03/2017" }

  let!(:weekly_event_previous_month) { create :event, :weekly, date: "01/01/2017" }
  let!(:weekly_event_current_month) { create :event, :weekly, date: "01/02/2017" }
  let!(:weekly_event_next_month) { create :event, :weekly, date: "01/03/2017" }

  let!(:monthly_event_previous_month) { create :event, :monthly, date: "01/01/2017" }
  let!(:monthly_event_current_month) { create :event, :monthly, date: "01/02/2017" }
  let!(:monthly_event_next_month) { create :event, :monthly, date: "01/03/2017" }

  let!(:yearly_event_previous_month) { create :event, :yearly, date: "01/01/2017" }
  let!(:yearly_event_current_month) { create :event, :yearly, date: "01/02/2017" }
  let!(:yearly_event_next_month) { create :event, :yearly, date: "01/03/2017" }

  describe "#all" do
    subject { query.all }

    it do
      is_expected.to match_array [once_event_current_month,
                                  daily_event_previous_month,
                                  daily_event_current_month,
                                  weekly_event_previous_month,
                                  weekly_event_current_month,
                                  monthly_event_previous_month,
                                  monthly_event_current_month,
                                  yearly_event_current_month]
    end
  end
end
