# encoding: utf-8
# Assignment(配属)のspec
#2016/1/10
#公演とキャストやレビュアーとの関係を保有する
require "spec_helper"
require "assignment"
require "role"
require "../show/lib/show"
require "../person/lib/person"
describe "Assignmentの基本的な振る舞い" do
  let(:testpersonid){"三谷幸喜"}
  let(:testshowid){"parco01"}
  let(:assignment){Assignment.new()}
  let(:person){Person.new(testpersonid)}
  let(:show){Show.new(testshowid)}
  before do
    assignment.show=show
    assignment.person=person
    assignment.role=Role.new(Role::DIRECTOR)
  end
  it '配属の公演は、設定したもの' do
    expect(assignment.show).to eq show
  end
  it "配属のパーソンは、設定したもの" do
    expect(assignment.person).to eq person
  end
  it "配属の役割は、演出家" do
    expect(assignment.role).to eq Role.new(Role::DIRECTOR)
  end
  it "配属を追加すると、演出家兼作家になる" do
    assignment.role << Role.new(Role::WRITER)
    expect(assignment.role).to eq Role.new(Role::WRITER)
    expect(assignment.role).to eq Role.new(Role::DIRECTOR)
  end

end