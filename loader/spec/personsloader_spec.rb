# encoding: utf-8
# Personsloaderのspec
#2016/1/10
require "spec_helper"
require "personsloader"

describe "personsのxmlファイルを読み込みpersonsを作成" do
    let(:personsloader){PersonsLoader.new('data/people/people.xml')}
   before do
    @persons=personsloader.get_persons()
  end
  it "personsの数は915人" do
    expect(@persons.count).to eq 915
  end
end