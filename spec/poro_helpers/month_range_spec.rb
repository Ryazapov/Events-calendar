describe MonthRange do
  context "when start date is valid" do
    let!(:start_date) { "2017-10-10" }
    subject(:month_range) { MonthRange.new(start_date) }

    describe "#to_range" do
      subject { month_range.to_range }
      let!(:month_start_date) { start_date.to_date.at_beginning_of_month }
      let!(:month_end_date) { start_date.to_date.end_of_month }

      it { is_expected.to eq (month_start_date..month_end_date) }
    end

    describe "#start_date" do
      subject { month_range.start_date }

      it { is_expected.to eq start_date.to_date.at_beginning_of_month }
    end
  end

  context "when start date is not valid" do
    let!(:start_date) { "qwerty" }
    subject(:month_range) { MonthRange.new(start_date) }

    describe "#to_range" do
      subject { month_range.to_range }
      let!(:month_start_date) { Time.zone.today.at_beginning_of_month }
      let!(:month_end_date) { Time.zone.today.end_of_month }

      it { is_expected.to eq (month_start_date..month_end_date) }
    end

    describe "#start_date" do
      subject { month_range.start_date }

      it { is_expected.to eq Time.zone.today.at_beginning_of_month }
    end
  end

  context "when start date is nil" do
    let!(:start_date) { nil }
    subject(:month_range) { MonthRange.new(start_date) }

    describe "#to_range" do
      subject { month_range.to_range }
      let!(:month_start_date) { Time.zone.today.at_beginning_of_month }
      let!(:month_end_date) { Time.zone.today.end_of_month }

      it { is_expected.to eq (month_start_date..month_end_date) }
    end

    describe "#start_date" do
      subject { month_range.start_date }

      it { is_expected.to eq Time.zone.today.at_beginning_of_month }
    end
  end
end
