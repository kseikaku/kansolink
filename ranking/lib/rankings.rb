# encoding:UTF-8
# Rankings Class
#2016/1/24
require "ranking"
require "../group/lib/group"
require "../person/lib/person"
require "../company/lib/company"
require "../show/lib/show"

class Rankings < Group
  def initialize
    super()
  end
  def getby(something)

    puts something.class
    if something.class==Rank
      @cond= -> rank{rank.rank==something}
    elsif something.class==Show
      @cond= -> rank{rank.show==something}
    elsif something.class==Person
      @cond= -> rank{rank.person==something}
    elsif something.class==Company
      @cond= -> rank{rank.company==something}
    elsif something.class==TermType
      @cond= -> rank{rank.termtype==something}
    elsif something.class==RankingType
      @cond= -> rank{rank.type==something}
    end
      
    @result=Rankings.new()
    super(something)
  end
end