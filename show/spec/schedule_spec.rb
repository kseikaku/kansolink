# Showのspec
#2015/12/29
require "spec_helper"
require "schedule"
describe "スケジュールの基本機能" do
  before do
    @schedule=Schedule.new
    @schedule.place="銀河劇場(天王州)"
    @schedule.fromdate="2015/01/10"
    @schedule.todate="2015/01/30"
  end
  it "開始日はfromdateを返す" do
    expect(@schedule.fromdate).to eq "2015/01/10"
  end
  it "終了日はtodateを返す" do
    expect(@schedule.todate).to eq "2015/01/30"
  end
  it "劇場名は、劇場名のみを返す" do
    expect(@schedule.place).to eq "銀河劇場"
  end
  it "年月を渡されたら、その月に公演開始ならばTrueを返す" do
    expect(@schedule.startby?("2015/01")).to be true
  end
  it "年月を渡されたら、その月に公演開始でなければfalseを返す" do
    expect(@schedule.startby?("2015/02")).to be false
  end
  it "劇場名を渡されてその劇場の公演であれば、Trueを返す" do
    expect(@schedule.placeat?("銀河劇場")).to be true
  end
  it "期間を求めると期間が返ってくる" do
    expect(@schedule.term).to eq "2015/01/10〜2015/01/30"
  end

end
