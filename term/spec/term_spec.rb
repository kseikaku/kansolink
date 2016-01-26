# encoding: utf-8
# Term　のスペック 
#2016/1/24
require "spec_helper"
require "term"
describe "Termに日付を設定するとタイプが返ってくる"  do
  let(:term) {Term.new('2015/01/01')}
  subject{term.termtype}
  it "同日の場合は、Dailyが返る" do
    is_expected.to eq Term::Daily
  end
  it "７日違えばWeeklyが返ってくる" do
    term.todate='2015/01/07'
    is_expected.to eq Term::Weekly
  end
  it "1ヶ月違えばMonthlyが返ってくる" do
    term.todate='2015/01/31'
    is_expected.to eq Term::Monthly
  end
end
