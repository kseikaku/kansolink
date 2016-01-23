# encoding: utf-8
# Assignmentsのspec
#2016/1/12
#公演とキャストやレビュアーとの関係の集合の仕様
require 'assignments'
require 'assignment'
require 'show'
require 'person'
require 'role'
describe "Assignmentsの基本的な振る舞い" do
  before do
    show1=Show.new('test01')
    show2=Show.new('test02')
    person1=Person.new('テスト太郎')
    person2=Person.new('テスト次郎')
    person3=Person.new('テスト三郎')
    role_director=Role.new(Role::DIRECTOR)
    role_writer=Role.new(Role::WRITER)
    role_cast=Role.new(Role::CAST)
    assign1=Assignment.new()
    assign2=Assignment.new()
    assign3=Assignment.new()
    assign4=Assignment.new()
    assign5=Assignment.new()
    assign1.show=show1
    assign1.person=person1
    assign1.role=role_director
    assign2.show=show1
    assign2.person=person2
    assign2.role=role_cast
    assign3.show=show2
    assign3.person=person1
    assign3.role=role_cast
    assign4.show=show2
    assign4.person=person3
    assign4.role=role_cast
    assign5.show=show2
    assign5.person=person3
    assign5.role=role_director

    @assignments=Assignments.new()

    @assignments << assign1
    @assignments << assign2
    @assignments << assign3
    @assignments << assign4
    @assignments << assign5


  end
  it "Assignの総数は4つ" do
    expect(@assignments.count).to eq 4
  end
  it "Personを指定して対象のAssignを取得することができる" do
    p=Person.new('テスト太郎')
    assigns=@assignments.getby(p)
    #expect(p.class).to eq Person
    expect(assigns.count).to eq 2
  end
  it "テスト太郎が、assignsに含まれている" do
    person=Person.new('テスト太郎') 
    expect(@assignments.has?(person)).to be true
  end 
  it "Roleを指定して対象のAssignを取得することができる" do
    role=Role.new(Role::CAST)
    assigns=@assignments.getby(role)
    expect(assigns.count).to eq 3
  end
  it "showを指定して対象のassignを取得することができる" do
    show=Show.new('test01')
    assigns=@assignments.getby(show)
    expect(assigns.count).to eq 2
  end
  it "showとpersonが同じassignmentsを一つにまとめる" do 
    expect(@assignments.count).to eq 4
  end

end
