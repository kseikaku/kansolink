# encoding:UTF-8
# XMLLoader Class
#2015/12/30
# フォルダのReviewXMLファイルを全て読み込む
require_relative "../../show/lib/shows"
require_relative "../../company/lib/companies"
require_relative "../../assignment/lib/assignments"
require_relative "../../loader/lib/companyloader"
require_relative "../../loader/lib/assignmentsloader"

class XmlLoader
  attr_reader :companies, :shows, :assignments
  def initialize(folder)
    @folder=folder
    @shows=Shows.new
    @companies=Companies.new
    @assignments=Assignments.new
    self.load
  end

  def load()
    Dir::foreach(@folder){|f|
      begin
        next unless File::ftype(@folder+f)=="file"
        next unless File.extname(@folder+f)==".xml"
        companyloader=CompanyLoader.new(@folder+f)
        assignmentsloader=AssignmentsLoader.new(@folder+f)
        #reviews=ReviewsLoader.new(@folder+f)
        shows=companyloader.get_shows
        @shows.concat(shows)
        @companies << companyloader.get_company
        @assignments.concat(assignmentsloader.get_assigns)
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
  def get_assignments
    return @assignments
  end
end
