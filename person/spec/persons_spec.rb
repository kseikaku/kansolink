# encoding: utf-8
# Personsのspec
#2016/1/9
require "spec_helper"
require "persons"
require "person"

describe "演劇関係者集合クラスの基本的な振る舞い" do
  before(:all) do
    @persons1=Persons.new()
    @persons2=Persons.new()
    person1=Person.new('三谷幸喜')
    person1.kname='みたにこうき'
    person1.fname="pmitani.html"
    @person2=Person.new('剛力彩芽')
    @person2.kname='ごうりきあやめ'
    @person2.fname="pgoriki.html"
    @person3=Person.new('山本耕史')
    @person3.kname='やまもとこうじ'
    @persons1 << person1
    @persons1 << @person2
    @persons2 << person1
    @persons2 << @person2
    @persons2 << @person3
  end
  it "演劇関係者の数は2人" do
    expect(@persons1.count).to eq 2
  end
  it "こでアクセスすると1名取得できる" do
    persons=@persons1.getbychar('こ')
    expect(persons.count).to eq 1
    expect(persons.class).to eq Persons
  end
  it "三谷幸喜で三谷幸喜取得できる" do
    person=@persons1.getbyid('三谷幸喜')
    expect(person.kname).to eq 'みたにこうき'
  end
  it "山本耕史はpersons1には含まれていない" do
    expect(@persons1.has?(@person3)).to be false
  end
  it "山本耕史はpersons2には含まれていない" do
    expect(@persons2.has?(@person3)).to be true
  end
  it "persons2をつなげると、person3(山本耕史)のみが追加される" do
    @persons1.concat(@persons2)
    expect(@persons2.count).to eq 3
  end
  it "personsからファイルネームでpersonを特定して抽出" do
    expect(@persons1.getbyfname("pgoriki.html").name).to eq @person2.name 
  end

end
