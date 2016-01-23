# encoding:UTF-8
# Reviews のスペックClass
#2016/1/20
require "spec_helper"
require "review"
require "reviews"
require "../show/lib/show"
require "../term/lib/term"
describe "Reviewsの基本的な振る舞い" do
  let(:show1){Show.new("test01")}
  let(:show2){Show.new("test02")}
  let(:review1){Review.new('http://www.test.com/test1.html')}
  let(:review2){Review.new('http://www.test.com/test2.html')}
  let(:review3){Review.new('http://www.test.com/test3.html')}
  let(:reviews){Reviews.new()}
  before do
    review1.show=show1
    review2.show=show1
    review3.show=show2
    review1.review_date="2016/01/10"
    review2.review_date="2015/12/20"
    review3.review_date="2015/12/31"
    review1.update_date="2016/01/20"
    review2.update_date="2016/01/20"
    review3.update_date="2016/01/15"
    review1.name="テスト１"
    review2.name="テスト１"
    review3.name="テスト3"
    reviews << review1
    reviews << review2
    reviews << review3
  end
  it "数がカウントできる" do
    expect(reviews.count).to eq 3
  end
  it "showを指定して対象reviewsを取得することができる" do
    expect(reviews.getby(show1).count).to eq 2
  end
  it "sortして、古い順に取得することができる" do
    idx=0
    reviews.each do |rev|
      idx +=1
      idx_str=idx.to_s
      expect(rev.url).to eq "http://www.test.com/test#{idx_str}.html"
    end 
    reviews.sort!
    expect_result=['2','3','1'] 
    idx=0
    reviews.each do |rev|
      idx +=1
      expect(rev.url).to eq "http://www.test.com/test#{expect_result[idx-1]}.html"
    end 

  end
  it "update日を指定して、対象を取得することができる" do
    expect(reviews.getby('2016/01/20').count).to eq 2
  end
  it "update期間を指定して、対象を指定することができる" do
    term=Term.new('2016/01/16')
    term.todate='2016/01/20'
    expect(reviews.getby(term).count).to eq 2    
  end
end
