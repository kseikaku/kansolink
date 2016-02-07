# encoding:UTF-8
# Content Class 's SPec (for google analystics content)
#201/1/26
require 'spec_helper'
require 'content'
require 'contenttype'
require '../ranking/lib/rank'
require '../term/lib/term'
describe "Content classの基本的な振る舞い" do
  let(:content){Content.new()}
  before do
    content.page="/index.html"
    content.pv=582
    content.line=1
    content.rank=Rank.new(1)
    content.fromdate='2016/01/17'
  end
  it "contentの設定した情報は取得できる" do
    expect(content.page).to eq '/index.html'
    expect(content.pv).to eq 582
    expect(content.line).to eq 1
    expect(content.rank).to eq Rank.new(1)
  end
  describe "設定されたページによって異なる" do
    subject {content.type}
    context 'showの関係ページの場合' do
      before do
        content.page='/shows/parco204.html'
      end
      it "ページのタイプはshow" do
        is_expected.to eq ContentType.new(ContentType::Show)
      end
    end
    context '劇団の関係ページの場合' do
      before do
        content.page='/review/cocoon.html'
      end
      it 'ページのタイプは、Company' do
        is_expected.to eq ContentType.new(ContentType::Company)
      end
    end
    context '人関係のページの場合' do
      before do
        content.page='/people/pawanemakoto.html' 
      end
      it 'ページのタイプは、people' do
        is_expected.to eq ContentType.new(ContentType::Person)
      end
    end
  end
  describe "コンテンツ対象の終了日(期間）によって期間タイプ(termtype)が異なる" do
    subject {content.termtype}
    context '1週間の場合' do
      before do 
        content.todate='2016/01/23'
      end
      it "TermTypeはWeeklyが返ってくる" do
        is_expected.to eq TermType.new(TermType::Weekly)
      end
    end
    context '１ヶ月の場合' do
      before do
        content.todate='2016/02/16'
      end
      it "TermTypeはMonthlyが返ってくる" do
        is_expected.to eq TermType.new(TermType::Monthly)
      end
    end
  end
end
