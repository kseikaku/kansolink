# encoding:UTF-8
# XMLLoader Class
#2015/12/30
# フォルダのReviewXMLファイルを全て読み込む
require "shows"
require "companyloader"
require "companies"

class XmlLoader
  def initialize(folder)
    @folder=folder
    @shows=Shows.new
    @companies=Companies.new
    self.load
  end

  def load()
    Dir::foreach(@folder){|f|
      begin
        next unless File::ftype(@folder+f)=="file"
        next unless File.extname(@folder+f)==".xml"
        companyloader=CompanyLoader.new(@folder+f)
        shows=companyloader.get_shows
        @shows.concat(shows)
        @companies << companyloader.get_company
      rescue Exception => e
        next        
      end
    }
  end
  def get_shows
    return @shows
  end 
  def get_companies
    return @companies
  end
end
