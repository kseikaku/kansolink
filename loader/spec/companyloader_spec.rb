# encoding: utf-8
# CompanyLoaderのspec
#2015/12/29
require "spec_helper"
require "companyloader"

describe "company loadeの基本動作" do
  before do
    @companyloader=CompanyLoader.new('data/2nkproject.xml')
    @shows=@companyloader.get_shows
    @company=@companyloader.get_company
  end
  it "showsの数は２個" do
    expect(@shows.count).to eq 3
  end
  it "showsの1個目はじゃじゃ馬馴らし" do
    @shows.each do |show|
      if show.id=="2nkproject1" then
        expect(show.title).to eq "じゃじゃ馬馴らし"
        expect(show.sortkey).to eq "じゃじゃうまならし"
        expect(show.theater).to eq "シアターX"
        expect(show.fromdate).to eq "2005/10/20"
        expect(show.todate).to eq "2005/10/23"
      end
    end
  end
  it "companyの名称は2NKプロジェクト" do
    expect(@company.name).to eq "2NKプロジェクト"
    expect(@company.kname).to eq "つーえぬけーぷろじぇくと"
  end
  it "companyの更新日付は20151231" do
    expect(@company.moddate).to eq "2016/01/17"
  end
end
