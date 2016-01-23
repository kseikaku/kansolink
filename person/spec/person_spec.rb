# encoding: utf-8
# Personのspec
#2016/1/9
require "spec_helper"
require "person"

describe "Person(演劇関係者)の基本的な振る舞い" do
  let(:name){'三谷幸喜'}
  let(:person){Person.new(name)}
  let(:kname){'みたにこうき'}
  let(:fname){'pmitani.html'}
  let(:urlencode){'test'}
  let(:wiki){'wiki/三谷幸喜'}
  let(:blog){'blog/mitani'}
  let(:twit){'twit/mitani'}
  let(:person2){Person.new(name)}
  before do
    person.kname=kname
    person.fname=fname
    person.urlencode=urlencode
    person.wiki=wiki
    person.blog=blog
    person.twit=twit
  end
  it '氏名は三谷幸喜' do
    expect(person.name).to eq name
  end
  it 'idも氏名と同じものが返ってくる' do
    expect(person.id).to eq person.name
  end
  it 'カナ氏名はみたにこうきが返ってくる' do
    expect(person.kname).to eq kname
  end
  it 'ファイル名はファイル名が返ってくる' do
    expect(person.fname).to eq fname
  end
  it 'URLエンコードはURLエンコードが返ってくる' do
    expect(person.urlencode).to eq urlencode
  end
  it 'wikiはwikiアドレスが返ってくる' do
    expect(person.wiki).to eq wiki
  end
  it 'blogはblogが返ってくる' do
    expect(person.blog).to eq blog
  end
  it 'twitはtwitが返ってくる' do
    expect(person.twit).to eq twit
  end
  it 'ソートキーは、かなが返ってくる' do
    expect(person.sortkey).to eq kname
  end
  it '”み”で始まるかは真が返る' do
    expect(person.startby?('み')).to be true
  end
  it "2つのPersonは同じとみなされる" do
    expect(person2.id).to eq '三谷幸喜'
    expect(person==person2).to be true
  end

end