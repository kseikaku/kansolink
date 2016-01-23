# encoding: utf-8
# CastSplitterのspec
#2016/1/14
require "spec_helper"
require "castsplitter"

describe "CastSplitterでキャストの文字列を分割する" do
  let(:cast1){'テスト太郎、テスト次郎、テスト三郎'}
  let(:cast2){'太郎,次郎,三郎,四郎'}
  let(:cast3){'マイケル/ジョー/テッド'}
  let(:cast4){'SEI KEI KOU TOU'}
  let(:cast5){'ライト／エル／ワタリ'}
  let(:cast6){'高木　真城　服部　佐々木'}

  it "、で区切ることができる。結果は3名" do
      casts=CastSplitter.new(cast1).get_casts
      expect(casts.count).to eq 3
  end
  it ",で区切る事ができる。結果は4名" do
    casts=CastSplitter.new(cast2).get_casts
    expect(casts.count).to eq 4
  end
  it "/で区切ることができる。結果は3名" do
    casts=CastSplitter.new(cast3).get_casts
    expect(casts.count).to eq 3
  end
  it " で区切る事ができる。結果は4名" do
    casts=CastSplitter.new(cast4).get_casts
    expect(casts.count).to eq 4
  end
  it "／で区切ることができる。結果は3名" do
    casts=CastSplitter.new(cast5).get_casts
    expect(casts.count).to eq 3
  end
  it "　で区切ることができる。結果は4名" do
    casts=CastSplitter.new(cast6).get_casts
    expect(casts.count).to eq 4
  end
end