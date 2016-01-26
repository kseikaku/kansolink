# encoding:UTF-8
# Ranking Class
#2016/1/24
require "../term/lib/term"
require "rank"
class Ranking

  def initialize(rank)
    @rank=rank
    @type=RankingType.new(RankingType::UNKNOWN)
  end
  def type=(type)
    @type=type
  end
  def show=(show)
    @show=show
  end
  def company=(company)
    @company=company
  end
  def person=(person)
    @person=person
  end
  def fromdate=(fromdate)
    @term=Term.new(fromdate)
  end
  def todate=(todate)
    @term.todate=todate
  end
  def type
    @type
  end
  def termtype
    @term.termtype
  end
  def text
    case @type.type
    when RankingType::SHOW
      "#{@company.name} 「#{@show.title}」"
    when RankingType::COMPANY
      "#{@company.name} 最新作「#{@show.title}」"
    when RankingType::PERSON
      "#{@person.name}さん 最新作「#{@show.title}」"
    end
  end
  def no
    @rank.no 
  end
  def rank
    @rank
  end
  def show
    @show
  end

end

class RankingType
  SHOW=1
  COMPANY=2
  PERSON=3
  UNKNOWN=99
  def initialize(type)
    @type=type
  end
  def type
    @type
  end
  def ==(rankingtype)
    return true if @type==rankingtype.type
    return false
  end
end