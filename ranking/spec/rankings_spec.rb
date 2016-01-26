# encoding:UTF-8
# Rankingsのスペック
#201/1/24
require "spec_helper"
require "rankings"
require "../show/lib/show"
require "../term/lib/term"
describe "Rankingsの基本的な振る舞い " do
  let(:rankings){Rankings.new()}
  let(:ranking1){Ranking.new(Rank.new(1))}
  let(:ranking2){Ranking.new(Rank.new(2))}
  let(:ranking3){Ranking.new(Rank.new(3))}
  let(:ranking4){Ranking.new(Rank.new(4))}
  let(:show1){Show.new('test01')}
  let(:show2){Show.new('test02')}
  let(:company){Company.new("test")}
  let(:person){Person.new("佐々木蔵之介")}
  before do
    ranking1.fromdate='2015/01/07'
    ranking1.todate="2015/01/13"
    ranking2.fromdate='2015/01/07'
    ranking2.todate='2015/01/13'
    ranking3.fromdate='2014/12/15'
    ranking3.todate='2015/01/14'
    ranking4.fromdate='2014/12/15'
    ranking4.todate='2015/01/14'
    ranking3.show=show1
    ranking4.show=show2
    ranking1.type=RankingType.new(RankingType::PERSON)
    ranking4.type=RankingType.new(RankingType::PERSON)
    rankings << ranking1
    rankings << ranking2
    rankings << ranking3
    rankings << ranking4
  end
  it "rankingsの数は４個" do
    expect(rankings.count).to eq 4
  end
  it "rankingsから順位を元にrankingを取得" do
    expect(rankings.getby(Rank.new(1)).count).to eq 1
  end
  it "rankingsからtermtypeを指定して、対象のrankingsが取得できる。" do
    expect(rankings.getby(TermType.new(TermType::Weekly)).count).to eq 2    
  end
  it "termtypeを指定して取得した場合、順位順に並んで取得可能" do
    monthly_rankings=rankings.getby(TermType.new(TermType::Monthly))
    idx=0
    monthly_rankings.each do |ranking|
      idx=idx+1
      str=idx.to_s
      expect(ranking.show.id).to eq "test0#{str}"
    end
  end
  it "RankingTypeを指定して取得する。2件返ってくる" do
    person_rankings=rankings.getby(RankingType.new(RankingType::PERSON))
    expect(person_rankings.count).to eq 2
  end
end
