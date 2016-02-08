# encoding: utf-8
# UpdateのSpec 
#2016/1/30
require "spec_helper"
require "update"
require "../company/lib/company"
require "../show/lib/show"
describe "Updateは、対象のcompanyデータからTwitter用データを構築する" do
  let(:company1){Company.new('test')}
  let(:show1){Show.new('test99')}
  let(:company2){Company.new('shiken')}
  let(:show2){Show.new('shiken99')}
  let(:update){Update.new(company1)}
  before do
    update.show=show1
    company1.twit="@test"
    update.show_count=30
    update.no=1
  end
  describe "twitterラインの振る舞い" do
    subject{update.twitter_line}
    describe "通常の長さの劇団名／タイトルの場合" do
      before do
        company1.name="テスト劇団"
        show1.title="テストタイトル"
      end
      it "全てのHashタグがついた状態で、Twitter用の文章が作成される(週間）" do
        is_expected.to eq "今週更新された劇団 1 テスト劇団 @test http://engeki.kansolink.com/review/test.html 最新作「テストタイトル」他30作品の劇評をお読みいただけます #演劇 #舞台 #劇評 engeki.kansolink.com"
      end
    end
    describe "劇団タイトルが長い場合" do
      before do
        company1.name="テスト劇団すごく長い劇団名の場合のテスト用"
        show1.title="テストタイトル　むちゃくちゃ長い題名のテストを行うためのTitle"
      end
      it "Company名称と公演タイトルがツイッターの必要な長さで生成される" do
        is_expected.to eq "今週更新された劇団 1 テスト劇団すごく長い劇団名の場合のテスト用 @test http://engeki.kansolink.com/review/test.html 最新作「テストタイトル　むちゃくちゃ長い題名のテストを行うためのTitle」他30作品の劇評が読めます #演劇"   
      end
    end
  end

  describe "blog_lineのテスト" do
    subject{update.blog_line}
    describe "リンク込のブログ用のセンテンスが戻ってくる" do
      before do
        company1.name="テスト劇団"
        show1.title="テストタイトル"
      end
      it "リンク付きのセンテンス" do
        is_expected.to eq "<li><a href='http://engeki.kansolink.com/review/test.html'>テスト劇団</a> 最新作「<a href='http://engeki.kansolink.com/shows/test99.html'>テストタイトル</a>」他</li>"
      end
    end
  end
end