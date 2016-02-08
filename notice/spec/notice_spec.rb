# encoding: utf-8
# noticeのspec
#2016/1/30
require "spec_helper"
require "notice"
describe "noticeクラスの振る舞い" do
  let(:notice){Notice.new('2016/01/31')}
  before do
    notice.load_update("/Users/kseikaku/Dropbox/Private/web/Data/XML/src/Kansolink/review/")
    notice.load_ranking("../loader/data/")

    notice.separate_rankings
    notice.save_twitter_data()
    notice.save_blog_data()
  end
  it "" do
    
  end
end
#Analytics engeki.kansolink.com- ページ 20160124-20160130.csv
#Analytics engeki.kansolink.com- ページ 20160124-20160130.csv