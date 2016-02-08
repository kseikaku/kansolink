# encoding:UTF-8
# UpdateSelecter SPEC
#2016/1/30
require "spec_helper"
require "updates"
require "updateselecter"
require "../show/lib/show"
require "../show/lib/shows"
require "../company/lib/company"
require "../company/lib/companies"
describe "UpdateSelecterの基本的な振る舞い" do
  let(:companies){Companies.new()} 
  let(:shows){Shows.new()} 
  let(:updateselecter){UpdateSelecter.new(companies)}
  let(:company1){Company.new('test')}
  let(:company2){Company.new('shiken')}
  let(:company3){Company.new('modified')}
  let(:company4){Company.new('updated')}
  let(:show11){Show.new('test1')}
  let(:show12){Show.new('test2')}
  let(:show21){Show.new('shiken1')}
  let(:show31){Show.new('modified1')}
  let(:show32){Show.new('modified2')}
  let(:show41){Show.new('updated1')}
  let(:show42){Show.new('updated2')}
  before do
    show11.title="テスト1"
    show12.title="テスト2"
    show21.title="試験1"
    show31.title="変更1"
    show32.title="変更2"
    show41.title="更新1"
    show42.title="更新2"
    show11.companyid="test"
    show12.companyid="test"
    show21.companyid="shiken"
    show31.companyid="modified"
    show32.companyid="modified"
    show41.companyid="updated"
    show42.companyid="updated"
    show11.fromdate="2015/01/01"
    show12.fromdate="2016/01/01"
    show21.fromdate="2015/01/01"
    show31.fromdate="2015/01/01"
    show32.fromdate="2016/01/01"
    show41.fromdate="2015/01/01"
    show42.fromdate="2016/01/01"

    shows << show11
    shows << show12
    shows << show21
    shows << show31
    shows << show32
    shows << show41
    shows << show42

    company1.name='劇団テスト'
    company1.moddate="2016/01/01"
    company2.name='劇団試験'
    company2.moddate="2016/01/01"
    company3.name='劇団変更'
    company3.moddate="2016/01/30"
    company4.name='劇団更新'
    company4.moddate="2016/01/30"

    companies << company1
    companies << company2
    companies << company3
    companies << company4

    updateselecter.shows=shows
    updateselecter.moddate="2016/01/30"
  end

  it "更新された劇団の数は2個" do
    expect(updateselecter.updates.count).to eq 2
  end

  it "Updatesの対象は、劇団変更と劇団更新" do
    idx=true
    updateselecter.updates.each do |update|
      if idx 
        expect(update.twitter_line).to eq '今週更新された劇団 1 劇団変更  http://engeki.kansolink.com/review/modified.html 最新作「変更2」他2作品の劇評をお読みいただけます #演劇 #舞台 #劇評 engeki.kansolink.com'
        idx=false
      else
        expect(update.twitter_line).to eq '今週更新された劇団 2 劇団更新  http://engeki.kansolink.com/review/updated.html 最新作「更新2」他2作品の劇評をお読みいただけます #演劇 #舞台 #劇評 engeki.kansolink.com'
      end
    end
  end

end