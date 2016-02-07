# encoding: utf-8
# ContentsLoaderのspec
#2016/1/30
require "spec_helper"
require "contentsloader"
describe "本物のデータを取り込む" do
  let(:contentsloader){ContentsLoader.new("data/Analytics engeki.kansolink.com- ページ 20151230-20160129.csv")}
  before do 
    @contents=contentsloader.contents
  end
  it "@contentsの数は1,000" do
    expect(@contents.count).to eq 1000
  end
  it "@contentsの１行目の内容はindex.htmlの内容" do
    content=@contents[0]
    expect(content.page).to eq "/index.html"
    expect(content.pv).to eq 2123
    expect(content.line).to eq 1
  end
  it "@contentsの２行目の内容はshowsのコクーン" do
    content=@contents[1]
    expect(content.page).to eq "/shows/cocoon100.html"
    expect(content.pv).to eq 410
    expect(content.line).to eq 2
    expect(content.type).to eq ContentType.new(ContentType::Show)
  end
  it "@contensの2行目の内容には、termの設定もされている。" do
    content=@contents[0]
    expect(content.fromdate).to eq '2015/12/30'
    expect(content.todate).to eq '2016/01/29'
    expect(content.termtype).to eq TermType.new(TermType::Monthly)
  end
end