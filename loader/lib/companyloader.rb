# encoding:UTF-8
# CompanyLoader Class
#2015/12/30  
#2016/1/23 update
require_relative "../../loader/lib/loader"
require_relative "../../show/lib/shows"
require_relative "../../show/lib/show"
require_relative "../../company/lib/company"
class CompanyLoader < Loader
  def initialize(filename)
    super(filename)
  end
  def load
    super()
    #ファイルの更新日付を取得
    filestat=File::stat(@filename)
    #日付のみをyyyy/mm/dd形式で設定 
    moddate=filestat.mtime.to_s.gsub!('-','/')[0..9]  #if moddate
    @loaditems=Shows.new
    @company=Company.new(@basename)
    @company.name=xmltext(@doc,'company/name')
    @company.kname=xmltext(@doc,'company/kananame')
    @company.url=xmltext(@doc,'company/hpurl')
    @company.twit=xmltext(@doc,'company/twit')
    @company.moddate=moddate
    idx=0
    @doc.elements.each('company/shows/show') do |showitem|
      idx=idx+1
      str=idx.to_s
      show=Show.new(@basename+str)
      show.companyid=@basename
      show.title=xmltext(showitem,'title')
      show.ktitle=xmltext(showitem,'ktitle')
      show.fromdate=xmltext(showitem,'fromdate')
      show.todate=xmltext(showitem,'todate')
      show.theater=xmltext(showitem,'theater')
      @items_array << show
    end
    make_return_items()
  end
  def get_shows
    get_items 
  end
  def get_company
    return @company
  end
end