# encoding:UTF-8
# ranking maker Class 's SPec (for google analystics contents)
#201/1/26
require 'spec_helper'
require 'content'
require '../show/lib/show'
require '../show/lib/shows'
require '../company/lib/company'
require '../company/lib/companies'
require '../person/lib/person'
require '../person/lib/persons'
require '../ranking/lib/rank'
require '../assignment/lib/assignment'
require '../assignment/lib/assignments'
require '../assignment/lib/role'
require 'rankingmaker'
describe "Ranking Makerのスペック" do
  let(:content1){Content.new()}
  let(:content2){Content.new()}
  let(:content3){Content.new()}
  let(:page_person){'/people/pmitani.html'}
  let(:page_show){'/shows/parco1.html'}
  let(:page_company){'/review/parco.html'}
  let(:show1){Show.new('parco1')}
  let(:show2){Show.new('parco2')}
  let(:company1){Company.new('parco')}
  let(:company2){Company.new('cocoon')}
  let(:person1){Person.new('三谷幸喜')}
  let(:person2){Person.new('天海祐希')}
  let(:assignment1){Assignment.new()}
  let(:assignment2){Assignment.new()}
  let(:weekly_from){'2016/01/17'}
  let(:monthly_from){'2015/12/24'}
  let(:todate){'2016/01/23'}
  let(:rankingmaker){RankingMaker.new}
  before do
    content1.page=page_show
    content1.rank=Rank.new(1)
    content2.page=page_company
    content2.rank=Rank.new(2)
    content3.page=page_person
    content3.rank=Rank.new(3)
    content1.fromdate=weekly_from
    content2.fromdate=weekly_from
    content3.fromdate=monthly_from
    content1.todate=todate
    content2.todate=todate
    content3.todate=todate
    shows=Shows.new()
    companies=Companies.new()
    persons=Persons.new()
    assignments=Assignments.new()
    show1.companyid='parco'
    show1.title="テスト１公演"
    show1.fromdate='2015/01/17'
    show2.companyid='parco'
    show2.title="テスト２公演"
    show2.fromdate="2015/12/01"
    person1.fname='pmitani.html'
    person2.fname='pamami.html'
    assignment1.show=show1
    assignment1.person=person1
    assignment1.role=Role.new(Role::DIRECTOR)
    assignment2.show=show2
    assignment2.person=person2
    assignment1.role=Role.new(Role::CAST)

    shows << show1
    shows << show2
    persons << person1
    persons << person2
    companies << company1
    companies << company2

    assignments << assignment1
    assignments << assignment2

    rankingmaker.shows=shows
    rankingmaker.persons=persons
    rankingmaker.companies=companies
    rankingmaker.assignments=assignments

  end
  it "コンテンツをランキングに変換(showのランキング)" do
    ranking=rankingmaker.makefrom(content1)
    expect(ranking.show).to eq show1
    expect(ranking.company).to eq company1
    expect(ranking.no).to eq 1
    expect(ranking.type).to eq RankingType.new(RankingType::RT_Show)
    expect(ranking.termtype).to eq TermType.new(TermType::Weekly)
  end
  it "コンテンツをランキングに変換(companyのランキング )" do
    ranking=rankingmaker.makefrom(content2)
    expect(ranking.company).to eq company1
    expect(ranking.show).to eq show2   #Parcoの劇団のより最新の公演はshow2
    expect(ranking.no).to eq 2
    expect(ranking.type).to eq RankingType.new(RankingType::RT_Company)
    expect(ranking.termtype).to eq TermType.new(TermType::Weekly)
  end
  it "コンテンツをランキングに変換(personのランキング )" do
    ranking=rankingmaker.makefrom(content3)
    expect(ranking.show).to eq show1
    expect(ranking.person).to eq person1
    expect(ranking.no).to eq 3
    expect(ranking.type).to eq RankingType.new(RankingType::RT_Person)
    expect(ranking.termtype).to eq TermType.new(TermType::Monthly)
  end
end
