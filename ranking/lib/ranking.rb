# encoding:UTF-8
# Ranking Class
#2016/1/24
require_relative "../../term/lib/term"
require_relative "../../ranking/lib/rank"
class Ranking
  attr_accessor :type,:show,:company,:person,:rank
  def initialize(rank)
    @rank=rank
    @type=RankingType.new(RankingType::RT_Unknown)
  end
  def fromdate=(fromdate)
    @term=Term.new(fromdate)
  end
  def todate=(todate)
    @term.todate=todate
  end
  def termtype
    @term.termtype
  end
  def no
    @rank.no 
  end
  def sortkey
    @rank.no
  end
  def text
    case @type.type
    when RankingType::RT_Show
      "#{@company.name} 「#{@show.title}」"
    when RankingType::RT_Company
      "#{@company.name} 最新作「#{@show.title}」"
    when RankingType::RT_Person
      "#{@person.name}さん 最新作「#{@show.title}」"
    end
  end
  def blog_line
    case @type.type
    when RankingType::RT_Show
      "<li>#{@company.link}「#{@show.link}」</li>"
    when RankingType::RT_Company
      "<li>#{@company.link} 最新作「#{@show.link}」</li>"
    when RankingType::RT_Person
      "<li>#{@person.link}さん 最新作「#{@show.link}」</li>"
    end

  end
  def twitter_line
    tags=["engeki.kansolink.com","#演劇","#舞台","#劇評"]
    if @term.termtype==TermType.new(TermType::Weekly)
      line="先週"
    elsif @term.termtype==TermType.new(TermType::Monthly)
      line="先月"
    end
    line="#{line}アクセス数 TOP"
    case @type.type
    when RankingType::RT_Show
      line="#{line} 公演 #{@rank.to_s} 「#{@show.title}」 http://engeki.kansolink.com/shows/#{@show.id}.html "
    when RankingType::RT_Company
      if @company.twit
        line="#{line} 劇団 #{@rank.to_s} #{@company.name} @#{@company.twit} http://engeki.kansolink.com/review/#{@company.id}.html "
      else
        line="#{line} 劇団 #{@rank.to_s} #{@company.name} http://engeki.kansolink.com/review/#{@company.id}.html "
      end
    when RankingType::RT_Person
      line="#{line} 人 #{@rank.to_s} #{@person.name} http://engeki.kansolink.com/people/#{@person.fname}"
    end

    tags.each do |tag|
      return line if "#{line} #{tag}".length > 140
      line="#{line} #{tag}"
    end
    return line    
  end

end

class RankingType
  RT_Show=1
  RT_Company=2
  RT_Person=3
  RT_Unknown=99

  attr_reader :type

  def initialize(type)
    @type=type
  end
  def ==(rankingtype)
    return true if @type==rankingtype.type
    return false
  end
end