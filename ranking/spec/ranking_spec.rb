# encoding:UTF-8
# Rankingのスペック
#201/1/24
require "spec_helper"
require "../review/lib/review"
require "../show/lib/show"
require "../company/lib/company"
require "../person/lib/person"
require "ranking"
describe "Rankingの通常の振る舞い" do
  let(:ranking1){Ranking.new(Rank.new(1))}
  let(:ranking2){Ranking.new(Rank.new(2))}
  let(:ranking3){Ranking.new(Rank.new(3))}
  let(:show){Show.new('test1')}
  let(:company){Company.new('test')}
  let(:person){Person.new('天海祐希')}
  before do
    show.title="テスト題名"
    company.name="テスト劇団"
    ranking1.type=RankingType.new(RankingType::SHOW)
    ranking1.show=show
    ranking1.company=company
    ranking1.fromdate="2015/01/01"
    ranking1.todate="2015/01/07"
    
    ranking2.type=RankingType.new(RankingType::COMPANY)
    ranking2.company=company 
    ranking2.show=show
    ranking2.fromdate="2015/01/01"
    ranking2.todate="2015/01/31"
    
    ranking3.person=person
    ranking3.type=RankingType.new(RankingType::PERSON)
    ranking3.show=show
  end

  it "順位を保有している" do
    expect(ranking1.no).to eq 1
  end
  it "テキストを保有している(公演)" do
    expect(ranking1.text).to eq "テスト劇団 「テスト題名」" 
  end
  it "タイプを保有している" do
    expect(ranking1.type).to eq RankingType.new(RankingType::SHOW)
  end
  it "テキストを保有している(劇団)" do
    expect(ranking2.text).to eq 'テスト劇団 最新作「テスト題名」'
  end
  it "テキストを保有している(人物)" do
    expect(ranking3.text).to eq '天海祐希さん 最新作「テスト題名」'
  end
  it "termtypeで期間のパターンが返ってくる" do
    expect(ranking1.termtype).to eq TermType.new(TermType::Weekly)
    expect(ranking2.termtype).to eq TermType.new(TermType::Monthly)
  end
end
