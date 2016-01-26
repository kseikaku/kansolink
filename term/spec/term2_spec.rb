# encoding: utf-8
# Term　のスペック 
#2016/1/24
require "spec_helper"
require "term"
describe "Termに日付を設定するとタイプが返ってくる"  do
  let(:term) {Term.new('2015/01/01')}
  #subject {@term.termtype}
  before do
    #@term=Term.new('2015/01/01')
  end
  it "from to が同一ならDailyが返ってくる"　do
    #term.todate='2015/01/01'
    #is_expected.to eq Term::Daily
    #expect(term.termtype).to eq Term::Daily
  end
  it "form to が７日違いならWeeklyが返ってくる" do
    #@term.todate='2015/01/08'
    #is_expected.to eq Term::Weekly
  end
  it "from to が１ヶ月違いならMonthlyが返ってくる" do
    #@term.todate='2015/01/31'
    #is_expected.to eq Term::Monthly
    
  end

end
