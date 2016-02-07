# encoding:UTF-8
# Contents Class 's SPec (for google analystics contents)
#201/1/26
require 'spec_helper'
require 'contents'
require 'content'
require '../ranking/lib/rank'
describe "Contentsの一般的な振る舞い" do
  let(:contents){Contents.new()}
  let(:content1){Content.new()}
  let(:content2){Content.new()}
  let(:content3){Content.new()}
  let(:content4){Content.new()}
  let(:page1){'/review/company.html'}
  let(:page2){'/shows/show.html'}
  let(:page3){'/people/people.html'}
  let(:ctype_company){ContentType.new(ContentType::Company)}
  let(:ctype_show){ContentType.new(ContentType::Show)}
  let(:ctype_person){ContentType.new(ContentType::Person)}
  before do
    content1.pv=100
    content2.pv=200
    content3.pv=300
    content4.pv=400
    content1.line=1
    content2.line=2
    content3.line=3
    content4.line=4
    contents << content1
    contents << content2
    contents << content3
    contents << content4
  end
  describe "reviewばかりの場合" do
    before do
      content1.page=page1
      content2.page=page1
      content3.page=page1
      content4.page=page1
      contents.sort!
    end
    it "戻ってくるページは全てpage1" do
      contents.each do |content|
        expect(content.page).to eq page1
      end
    end
    it "コンテンツタイプで検索したら４件戻ってくる" do
      test_contents=contents.getby(ctype_company)
      expect(test_contents.count).to eq 4
    end
    it "コンテンツをソートしたらcontentは逆順(pvの多い順）で返ってくる" do
      test_array=Array.new()
      contents.each do |cont|
        test_array << cont
      end
      expect(test_array).to match([content4,content3,content2,content1])
      #配列通りに返ってくることを確認するマッチャ
      #http://qiita.com/jnchito/items/a4a51852c2c678b57868を参照
    end
    it "各コンテンツの順位も逆順になっている" do
      expect(content4.rank).to eq Rank.new(1)
      expect(content3.rank).to eq Rank.new(2)
      expect(content2.rank).to eq Rank.new(3)
      expect(content1.rank).to eq Rank.new(4)
    end
  end
  describe "２つがpersonの場合" do
    before do
      content1.page=page3
      content3.page=page3
    end
    it "コンテンツタイプで検索したら２件戻ってくる" do
      test_contents=contents.getby(ctype_person)
      expect(test_contents.count).to eq 2
    end
    it "コンテンツタイプで検索したらものをソートするとその中でRanking" do
      test_contents=contents.getby(ctype_person)
      test_contents.sort!
      expect(content3.rank).to eq Rank.new(1)
      expect(content1.rank).to eq Rank.new(2)
    end
  end
end
