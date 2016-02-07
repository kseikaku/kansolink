# encoding: utf-8
# CompanyLoaderのspec
#2015/12/29
require "spec_helper"
require "company"

describe "Companyの基本的な振る舞い" do
  let(:company){Company.new("test")}
  before do
    company.name="テスト"
    company.kname="てすと"
    company.url="http://test.com"
    company.twit="@twit"
    company.blog="http://blog.test.com/test/"

  end
  it "Companyの属性が確認できる" do
    expect(company.id).to eq "test"
    expect(company.name).to eq "テスト"
    expect(company.kname).to eq "てすと"
    expect(company.url).to eq "http://test.com"
    expect(company.twit).to eq "@twit"
    expect(company.blog).to eq "http://blog.test.com/test/"
  end
  it "linkの形式で返ってくる" do
    expect(company.link).to eq "<a href='http://engeki.kansolink.com/review/test.html'>テスト</a>"
  end
end