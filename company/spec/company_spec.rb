# encoding: utf-8
# CompanyLoaderのspec
#2015/12/29
require "spec_helper"
require "company"

describe "Companyの基本的な振る舞い" do
  before do
    @company=Company.new("test")
    @company.name="テスト"
    @company.kname="てすと"
    @company.url="http://test.com"

  end
  it "Companyの属性が確認できる" do
    expect(@company.id).to eq "test"
    expect(@company.name).to eq "テスト"
    expect(@company.kname).to eq "てすと"
    expect(@company.url).to eq "http://test.com"
  end
end