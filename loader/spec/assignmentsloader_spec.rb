# encoding: utf-8
# AssignmentsLoaderのspec
#2016/1/14
require "spec_helper"
require "assignmentsloader"
describe "docからassignmentsを読み込む" do
  before do
    assignmentsloader=AssignmentsLoader.new('data/2nkproject.xml')
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
    @assignments.each do |assign|
      puts assign.person.id
    end
  end

end
