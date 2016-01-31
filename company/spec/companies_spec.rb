# encoding: utf-8
# CompanyLoaderのspec
#2015/12/29
require "spec_helper"
require "company"
require "companies"
describe "Companiesの基本的な振る舞い" do
  before do
    c1=Company.new("test")
    c1.name="テスト"
    c2=Company.new("siken")
    c2.name="試験"
    c1.moddate="2015/12/29"
    c2.moddate="2015/12/30"
    @companies=Companies.new()
    @companies << c1
    @companies << c2
  end
  it "Companyの数は2つ" do
    expect(@companies.count).to eq 2
  end
  it "id='test'の劇団名はテスト" do
    c=@companies.getbyid('test')
    expect(c.name).to eq 'テスト'
  end
  it "2015/12/30の更新日で抽出すると1つ" do
    cs=@companies.getbymoddate('2015/12/30')
    expect(cs.count).to eq 1
  end
end