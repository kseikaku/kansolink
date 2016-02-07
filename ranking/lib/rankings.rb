# encoding:UTF-8
# Rankings Class
#2016/1/24
require_relative "../../ranking/lib/ranking"
require_relative "../../group/lib/group"
require_relative "../../person/lib/person"
require_relative "../../company/lib/company"
require_relative "../../show/lib/show"

class Rankings < Group
  def initialize
    super()
  end
  def <<(ranking)
    puts ranking.class unless ranking.class == Ranking
    super(ranking)
  end
  def getby(something)

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
  def sort!(dir)
    super(dir)
    @item_array.each_with_index do |ranking,index|
      ranking.rank=Rank.new(index+1)
    end
  end
end