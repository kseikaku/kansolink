# encoding: utf-8
# Converterのspec
#2016/1/8
require "spec_helper"
require "converter"
require "nkf"

describe "ConverterでUTF8のファイルを変更する" do

  let(:filename){'data/2625dan.xml'}

  it "filenameは間違いなく2625dan.xml" do
    expect(filename).to eq "data/2625dan.xml"
  end
  describe '元ファイル属性確認' do 
    before do
      File.open(filename) do |file|
        @str_org=file.read
      end
    end
    it "元ファイルはCP320" do
      expect(NKF.guess(@str_org)).to eq Encoding::WINDOWS_31J
    end
    it "元ファイルにはShift_JISが含まれる" do
       expect(@str_org.include?('Shift_JIS')).to be true     
    end
  end

  describe '変換後ファイル属性確認' do
    
    let(:converter){Converter.new()}
    before do
      tempfile=converter.convert(filename)
      File.open(tempfile) do |file|
        @str_to = file.read
      end
    end
    it "変換されたファイルは、UTF-8" do
      expect(NKF.guess(@str_to)).to eq NKF::UTF8
    end
    it "変換後ファイルはUTF-8を含む" do
      expect(@str_to.include?('UTF-8')).to be true
    end
  end
end