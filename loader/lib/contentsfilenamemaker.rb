# encoding:UTF-8
# ContentsFilenameMaker
# Google Analystics のコンテンツファイル名を作成する
#2016/2/2
require "date"
require_relative "../../term/lib/term"
class ContentsFilenameMaker
  DATE_FORMAT="%Y/%m/%d" 
  CONTENT_FILE_PREFIX="Analytics engeki.kansolink.com- ページ "
  CONTENT_FILE_SUFIX=".csv"
  def initialize(update)
    date_to=Date.parse(update)
    todate=(date_to-1).strftime(DATE_FORMAT)
    fromdate_weekly=(date_to-7).strftime(DATE_FORMAT)
    date_from=date_to << 1
    fromdate_monthly=date_from.strftime(DATE_FORMAT)
    @term_weekly=Term.new(fromdate_weekly)
    @term_weekly.todate=todate
    @term_monthly=Term.new(fromdate_monthly)
    @term_monthly.todate=todate
  end
  def weekly_filename(folder)
    return "#{folder}#{CONTENT_FILE_PREFIX}#{@term_weekly.to_s}#{CONTENT_FILE_SUFIX}"
  end
  def monthly_filename(folder)
    return "#{folder}#{CONTENT_FILE_PREFIX}#{@term_monthly.to_s}#{CONTENT_FILE_SUFIX}"
  end
end
