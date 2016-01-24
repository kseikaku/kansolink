# encoding: utf-8
# CompanyLoaderのspec
#2015/12/29
require "spec_helper"
require "xmlloader"

describe "XmlLoaderの基本的な振る舞い" do
  before do
    @xmlloader=XmlLoader.new('data/')
  end
  it "ファイルを読み込んでshowsを取り出せる。" do
    shows=@xmlloader.get_shows
    expect(shows.count).to eq 18
  end
  it "劇団の数は4個" do
    companies=@xmlloader.get_companies
    expect(companies.count).to eq 4
  end
  it "assignmentsは171" do
    assignments=@xmlloader.get_assignments
    expect(assignments.count).to eq 171
  end

end