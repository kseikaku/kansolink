# encoding:UTF-8
# Review のスペックClass
#2016/1/20
require "spec_helper"
require "review"
require "../show/lib/show"
describe "Review(劇評）の基本的な振る舞い" do
  let(:review1){Review.new('http://www.test.com/test.html')}
  let(:review2){Review.new(nil)}
  let(:show){Show.new('test01')}
  before do
    review1.name="テスト"
    review1.review_date="2015/01/11"
    review1.update_date="2016/02/01"
    review1.show=show
    review2.name="無効テスト"
    review2.review_date="2001/01/01"
    review2.update_date="2015/01/01"
    review2.show=show
  end
  it "review1の情報が取得可能" do
    expect(review1.url).to eq "http://www.test.com/test.html"
    expect(review1.name).to eq "テスト"
    expect(review1.review_date).to eq "2015/01/11"
    expect(review1.update_date).to eq "2016/02/01"
    expect(review1.show).to eq show
  end
  it "review1は有効" do
    expect(review1.valid?).to be true
  end
  it "review2は無効" do
    expect(review2.valid?).to be false
  end
  it "sortkeyはreview_dateが戻る" do
    expect(review1.sortkey).to eq "2015/01/11"
    expect(review2.sortkey).to eq "2001/01/01"
  end
  it "年月情報が取得できる" do
    expect(review1.rev_year_month).to eq "2015/01"
  end
end
