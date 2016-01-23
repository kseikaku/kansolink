# encoding: utf-8
# Nameのspec
#2015/12/29
require "spec_helper"
require "name"


describe "Name" do
  before do
    @name=Name.new()
    @name.name="テスト"
    @name.kname="てすと"
  end
  it "テストという" do
    expect(@name.name).to eq "テスト"
  end
  it "ふりがなを返す" do
    expect(@name.kname).to eq "てすと"
  end
  it "ソートキーとしてふりがなを返す" do
    expect(@name.sortkey).to eq "てすと"
  end
  it "頭文字「て」を与えるとTrueを返す" do
    expect(@name.startby?("て")).to be true
  end
  it "頭文字「て」を与えるとTrueを返す" do
    @name.kname="でずど"
    expect(@name.startby?("て")).to be true
  end
  it "頭文字「て」を与えるとTrueを返す" do
    @name.kname="がずど"
    expect(@name.startby?("て")).to be false
  end
end