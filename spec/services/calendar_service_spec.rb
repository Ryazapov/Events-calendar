describe CalendarService do
  let(:current_month) { ("01/03/2017".to_date.."31/03/2017".to_date) }

  subject(:query) { described_class.new(current_month) }

  describe "#events" do
    subject(:events) { query.events }

    context "when current month contains once event" do
      let!(:once_event) { create :event, :once, date: "02/03/2017" }

      it { is_expected.to include 2 }
    end

    context "when current month contains daily event" do
      let!(:daily_event_1) { create :event, :daily, date: "10/03/2017" }

      it { is_expected.to include(*(10..31).to_a) }
    end

    context "when current month contains weekly event" do
      let!(:daily_event_1) { create :event, :weekly, date: "10/03/2017" }

      it { is_expected.to include 10, 17, 24, 31 }
    end

    context "when current month contains monthly event" do
      let!(:daily_event_1) { create :event, :monthly, date: "10/01/2017" }

      it { is_expected.to include 10 }
    end

    context "when current month contains yearly event" do
      let!(:daily_event_1) { create :event, :yearly, date: "01/03/2017" }

      it { is_expected.to include 1 }
    end

    context "when day in current month contains some events" do
      let!(:once_event) { create :event, :once, date: "02/03/2017" }
      let!(:daily_event) { create :event, :daily, date: "01/03/2017" }
      let!(:weekly_event) { create :event, :weekly, date: "02/03/2017" }
      let!(:monthly_event) { create :event, :monthly, date: "02/03/2017" }
      let!(:yearly_event) { create :event, :yearly, date: "02/03/2017" }

      its([2]) { is_expected.to match_array [once_event, daily_event, weekly_event, monthly_event, yearly_event] }
    end
  end
end
