# encoding: utf-8
# Showのspec
#2015/12/29
require "spec_helper"
require "show"

describe "showの基本的な振る舞い" do
  before do
    @show=Show.new("test01")
    @show.title="テスト"
    @show.ktitle="てすと"
    @show.theater="駅前劇場(下北沢)"
    @show.fromdate="2015/12/10"
    @show.todate="2015/12/25"
    @show.companyid="test"
    @show2=Show.new("test01")
  end
  it "" do
    expect(1+1).to eq 2
  end
  it "showidが返ってくる" do
    expect(@show.id).to eq "test01"
  end
  it "titleが返ってくる" do
    expect(@show.title).to eq "テスト"
  end
  it "てで始まるかの確認で、Trueを返す" do
    expect(@show.startby?("て")).to be true
  end
  it "[ざ]で始まるかの確認ではfalseを返す" do
    expect(@show.startby?("さ")).to be false
  end
  it "駅前劇場でやったかを尋ねるとTrueを返す" do
    expect(@show.placeat?("駅前劇場")).to be true
  end
  it "2015/12に公演をやったかを尋ねるとTrueを返す" do
    expect(@show.datestartby?("2015/12")).to be true
  end
  it "companyidはtestが返る" do
    expect(@show.companyid).to eq "test"
  end
  it "Show1とShow2は同一" do
    expect(@show==@show2).to be true
  end
end
