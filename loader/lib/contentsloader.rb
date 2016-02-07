# encoding:UTF-8
# ContentsLoader Class
#2016/1/30
require_relative "../../ga_content/lib/contents"
require_relative "../../ga_content/lib/content"
require_relative "../../ranking/lib/rank"
require "csv"

class ContentsLoader
  attr_reader :contents
  def initialize(filename)
    @filename=filename
    @contents=Contents.new()
    load()
  end
  private
    def load
      #puts File.exist?(@filename)
      open(@filename) do |file|
        file.each_line do |line|
          case file.lineno
          when 4
            set_term(line)
          when (8..1007)
            set_content(line,file.lineno)
          end
        end
      end
    end
    def set_term(line)
      fromdate=line[2..9]
      todate=line[11..18]
      fromdate="#{fromdate[0..3]}/#{fromdate[4..5]}/#{fromdate[6..7]}"
      todate="#{todate[0..3]}/#{todate[4..5]}/#{todate[6..7]}"
      @term=Term.new(fromdate)
      @term.todate=todate
    end
    def set_content(line,lineno)
      return unless line[0]=='/'
      content=Content.new()
      datas=CSV.parse(line)
      content.page=datas[0][0]
      content.pv=datas[0][1].gsub(",","").to_i
      content.line=lineno-7
      content.rank=Rank.new(lineno-7)
      content.fromdate=@term.fromdate
      content.todate=@term.todate
      @contents << content
    end
end
