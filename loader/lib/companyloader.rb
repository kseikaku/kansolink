# encoding:UTF-8
# CompanyLoader Class
#2015/12/30
require "rexml/document"
require "../show/lib/shows"
require "../show/lib/show"
require "converter"
require "../company/lib/company"
class CompanyLoader
  def initialize(filename)
    @filename=filename
    @converter=Converter.new()
    self.load
  end
  def load
    #doc = REXML::Document.new(File.new(@filename))
    #xml=File.open(@filename)
    #S-JISのファイルをconverterクラスで、UTF-８のXMLに変換してパースする
    converted_filename=@converter.convert(@filename)
    xml=File.open(converted_filename)
    doc = REXML::Document.new(xml)
    basename=File.basename(@filename,".xml")
    #ファイルの更新日付を取得
    filestat=File::stat(@filename)
    #日付のみをyyyy/mm/dd形式で設定 
    moddate=filestat.mtime.to_s.gsub!('-','/')[0..9]  #if moddate
    @shows=Shows.new
    @company=Company.new(basename)
    @company.name=doc.elements['company/name'].text if doc.elements['company/name'] 
    @company.kname=doc.elements['company/kananame'].text if doc.elements['company/kananame'] 
    @company.url=doc.elements['company/hpurl'].text  if doc.elements['company/hpurl']
    @company.moddate=moddate
    idx=0
    doc.elements.each('company/shows/show') do |showitem|
      idx=idx+1
      str=idx.to_s
      show=Show.new(basename+str)
      show.companyid=basename
      show.title=showitem.elements['title'].text
      show.ktitle=showitem.elements['ktitle'].text      if showitem.elements['ktitle']
      show.fromdate=showitem.elements['fromdate'].text  if showitem.elements['fromdate']
      show.todate=showitem.elements['todate'].text      if showitem.elements['todate']
      show.theater=showitem.elements['theater'].text    if showitem.elements['theater']
      @shows << show
    end
    rescue => ex
    puts @filename
    puts ex.message
    puts ex.class
    puts ex.backtrace
  end
  def get_shows
    return @shows
  end
  def get_company
    return @company
  end
end