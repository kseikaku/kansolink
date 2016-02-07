# encoding:UTF-8
# ContentType Class
require_relative "../../group/lib/group"
class Contents < Group
  def getby(something)
    if something.class==ContentType
      @cond= -> cont{cont.type==something}
    elsif something.class==TermType
      @cond= -> cont{cont.termtype==something}
    else
      return nil 
    end

    @result=Contents.new()
    super(something)
  end
  def sort!
    @item_array.sort!{|a,b| b.pv <=> a.pv}
    @item_array.each_with_index do |cont,i| 
      cont.rank=Rank.new(i+1)
    end
  end

end
