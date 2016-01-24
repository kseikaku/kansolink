# encoding:UTF-8
# Reviewer のスペック
#2016/1/23
require "spec_helper"
require "reviewer"

describe "Reviewer(劇評者)のclassの振る舞い" do
  let(:reviewer1){Reviewer.new('清角克由')}
  let(:reviewer2){Reviewer.new('いっちゃん')}
  it "劇評者は、名前が取得できる" do
    expect(reviewer1.name).to eq '清角克由'
  end
  it "劇評者(清角)の有効が返ってくる" do
    expect(reviewer1.valid?).to be_truthy
  end
  it "劇評者(いっちゃん）は非有効" do
    expect(reviewer2.valid?).to be_falsy
  end
end
