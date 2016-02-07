# encoding: utf-8
# ContentsFilenameMakerのスペック
# ファイルの存在まで確認 
#2016/2/2
require "spec_helper"
require "contentsfilenamemaker"
describe "コンテンツファイルの名称作成" do
  let(:contents_filename_maker){ContentsFilenameMaker.new('2016/01/31')}
  it "weeklyfilenameが取得できる" do
    expect(contents_filename_maker.weekly_filename('data/')).to eq 'data/Analytics engeki.kansolink.com- ページ 20160124-20160130.csv'
  end
  it "weeklyfilenameが存在する" do
    expect(File.exists?(contents_filename_maker.weekly_filename('data/'))).to be true
  end
  it "monthlyfilenameが取得できる" do
    expect(contents_filename_maker.monthly_filename('data/')).to eq 'data/Analytics engeki.kansolink.com- ページ 20151231-20160130.csv'
  end
  it "monthlyfilenameが存在する" do
    expect(File.exists?(contents_filename_maker.monthly_filename('data/'))).to be true
  end
end