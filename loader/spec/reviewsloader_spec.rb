# encoding:UTF-8
# Reviewsloader のスペック
#2016/1/23
require "spec_helper"
require "reviewsloader"
#require "../review/lib/reviewer"
describe "劇評情報の取り込み" do
  let(:show){Show.new('2nkproject1')}
  before do
    reviewsloader=Reviewsloader.new('data/2nkproject.xml')
    @reviews=reviewsloader.get_items
  end
  it "reviewsの数は3" do
    expect(@reviews.count).to eq 3
  end
  it "showで対象を取得したらreviewは１個" do
    expect(@reviews.getby(show).count).to eq 1
  end
  it "取得できたreviewの内容" do
    reviews = @reviews.getby(show)
    reviews.each do |rev|
      expect(rev.name).to eq 'Cooney'
      expect(rev.url).to eq 'http://homepage3.nifty.com/engeki/RP2005.10.htm#1'
      expect(rev.review_date).to eq '2005/10/20'
      expect(rev.update_date).to eq '2005/11/12'
    end   
  end
end
