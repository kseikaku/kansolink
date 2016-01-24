# encoding: utf-8
# AssignmentsLoaderのspec
#2016/1/14
require "spec_helper"
require "assignmentsloader"
describe "docからassignmentsを読み込む" do
  before do
    assignmentsloader=AssignmentsLoader.new('data/2nkproject.xml')
    #assignmentsloader=AssignmentsLoader.new('data/2625dan.xml')
    @assignments=assignmentsloader.get_assigns()
  end
  it "castや演出家、脚本家であわせて39人" do
    expect(@assignments.count).to eq 39
  end
  it "Directorは3つ" do
    role=Role.new(Role::DIRECTOR)
    expect(@assignments.getby(role).count).to eq 3
  end
  it "Showのタイトルがじゃじゃ馬ダミーのアサインメンツは2つ" do
    show=Show.new('2nkproject3')
    expect(@assignments.getby(show).count).to eq 3
  end
  it "Showタイトルがじゃじゃ馬ダミーの水口てつは、ディレクター兼役者" do 
    show=Show.new('2nkproject3')
    person=Person.new('水口てつ')
    test_assignments=@assignments.getby(show)
    expect(test_assignments.count).to eq 3
    expect(test_assignments.getby(person).count).to eq 1
    test_assignments.getby(person).each do |assign|
      expect(assign.role).to eq Role.new(Role::DIRECTOR)
      expect(assign.role).to eq Role.new(Role::CAST)
    end
  end
  it "assignmentsの一覧をプリント" do
    expected=["水口てつ","岡村美雪","前田真里","中山研","太田佳伸","滝藤賢一","近田英紀","友松タケホ",
      "町田沙織","内田慎二","吉田聡","奥住昌敏","岩城博","志賀正人","三沢一世","水野孝志","福山秀子",
      "佐藤里恵","水口てつ","岡村美雪","前田真里","中山研","太田佳伸","滝藤賢一","近田英紀","友松タケホ",
      "町田沙織","内田慎二","吉田聡","奥住昌敏","岩城博","志賀正人","三沢一世","水野孝志","福山秀子",
      "佐藤里恵","水口てつ","滝藤賢一","佐藤里恵"]
    person_array=Array.new()
    @assignments.each do |assign|
      person_array.push(assign.person.id) 
    end
    expect(person_array).to match_array(expected)
  end

end
